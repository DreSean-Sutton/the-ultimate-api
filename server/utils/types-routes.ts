export interface ReqParams {
  table: string,
  id: string,
  type: string
}

export interface Req {
  query: object,
  params: ReqParams,
  body: any
  headers: {
    authorization: string,
    username: string
  }
}

interface ResStatus {
  send: (param1: object) => any
  json: (param1: object) => any
}

export interface Res {
  status: (param1: number) => ResStatus
}


export interface QueryString {
  fighter?: string,
  fighterId?: string,
  orderByRosterId?: string,
  rosterId?: string
}
