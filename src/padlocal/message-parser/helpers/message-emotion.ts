import { Message } from "padlocal-client-ts/dist/proto/padlocal_pb";
import { xmlToJson } from "../../utils/xml-to-json";

interface EmotionXmlSchema {
  msg: {
    emoji: {
      $: {
        type: string;
        len: string;
        cdnurl: string;
        width: string;
        height: string;
        md5: string;
      };
    };
    gameext: {
      $: {
        content: string;
        type: string;
      };
    };
  };
}

export interface EmojiMessagePayload {
  type: number;
  len: number;
  md5: string;
  cdnurl: string;
  width: number;
  height: number;
  gameext?: string;
}

export async function emotionPayloadParser(message: Message.AsObject): Promise<EmojiMessagePayload> {
  const jsonPayload: EmotionXmlSchema = await xmlToJson(message.content);

  const len = parseInt(jsonPayload.msg.emoji.$.len, 10) || 0;
  const width = parseInt(jsonPayload.msg.emoji.$.width, 10) || 0;
  const height = parseInt(jsonPayload.msg.emoji.$.height, 10) || 0;
  const cdnurl = jsonPayload.msg.emoji.$.cdnurl;
  const type = parseInt(jsonPayload.msg.emoji.$.type, 10) || 0;
  const md5 = jsonPayload.msg.emoji.$.md5;

  let gameext;
  if (jsonPayload.msg.gameext) {
    const gameextType = parseInt(jsonPayload.msg.gameext.$.type, 10) || 0;
    const gameextContent = parseInt(jsonPayload.msg.gameext.$.content, 10) || 0;
    gameext = `<gameext type="${gameextType}" content="${gameextContent}" ></gameext>`;
  }

  return {
    type,
    len,
    md5,
    cdnurl,
    height,
    width,
    gameext,
  };
}

export function emotionPayloadGenerator(emojiMessagePayload: EmojiMessagePayload): string {
  return `<msg><emoji cdnurl="${emojiMessagePayload.cdnurl}" len="${emojiMessagePayload.len}" md5="${
    emojiMessagePayload.md5
  }" type="${emojiMessagePayload.type}"/>${emojiMessagePayload.gameext || ""}</msg>`;
}
