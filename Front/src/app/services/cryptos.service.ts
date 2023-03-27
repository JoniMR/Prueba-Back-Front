import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Cryptos } from '../models/interfaces/cryptos';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class CryptosService {
  constructor(private http: HttpClient) {
    console.log('Servicio HTTP');
  }

  getUsers(): Observable<Cryptos[]> {
    return this.http.get<Cryptos[]>('http://localhost:5000/api/crypto/all');
  }
}