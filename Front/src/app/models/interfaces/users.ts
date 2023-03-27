export interface Users {
    crypto_id: string;
    username: string;
    password: string;
    email: string;
    name: string;
    surname1: string;
    surname2?: number;
    birthdate: Date;
    funds: number;
}