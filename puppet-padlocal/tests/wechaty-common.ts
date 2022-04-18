import { Contact, log, Wechaty } from "wechaty";
import { ScanStatus } from "wechaty-puppet";
import config from "config";
import PuppetPadlocal from "../src/puppet-padlocal";

// log.level("silly");

export function createBot(): Wechaty {
  const token: string = config.get("padLocal.token");
  const puppet = new PuppetPadlocal({
    token,
  });

  return new Wechaty({
    name: "TestBot",
    puppet,
  });
}

type PrepareBotFunc = (bot: Wechaty) => Promise<void>;

export async function prepareSingedOnBot(prepareBotFunc?: PrepareBotFunc): Promise<Wechaty> {
  const bot = createBot();

  bot.on("scan", (qrcode: string, status: ScanStatus) => {
    if (status === ScanStatus.Waiting && qrcode) {
      const qrcodeImageUrl = ["https://api.qrserver.com/v1/create-qr-code/?data=", encodeURIComponent(qrcode)].join("");
      log.info("TestBot", "onScan: %s(%s) - %s", ScanStatus[status], status, qrcodeImageUrl);
    } else {
      log.info("TestBot", "onScan: %s(%s)", ScanStatus[status], status);
    }
  });

  bot.on("login", (user: Contact) => {
    log.info("TestBot", "%s login", user);
  });

  bot.on("logout", (user: Contact, reason: string) => {
    log.info("TestBot", "%s logout, reason:%s", user, reason);
  });

  await bot.start();

  log.info("TestBot", "TestBot started.");

  await prepareBotFunc?.(bot);

  await bot.ready();

  log.info("TestBot", "TestBot ready.");

  return bot;
}
