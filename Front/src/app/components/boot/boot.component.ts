import { Component, OnInit, Input, Output } from '@angular/core';
import { FormControl } from '@angular/forms';

@Component({
  selector: 'app-boot',
  templateUrl: './boot.component.html',
  styleUrls: ['./boot.component.scss']
})
export class BootComponent implements OnInit {

  loginForm = new FormControl();

  usuario: string = '';

  loginClick() {
    this.usuario = this.loginForm.value;
    console.log(this.usuario);
    localStorage.setItem('User', this.usuario);
  }

  constructor() {}

  ngOnInit(): void {
  }

}
