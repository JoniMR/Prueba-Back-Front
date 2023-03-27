import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent implements OnInit{
  title = 'Prueba-Tabla-Angular';

  constructor() {
    console.log("El componente app se ha creado");
  }

  ngOnInit(): void {
    console.log("El componente app se ha inicializado");
  }
}
