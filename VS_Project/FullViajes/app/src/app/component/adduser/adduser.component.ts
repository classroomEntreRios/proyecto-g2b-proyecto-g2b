import { HttpErrorResponse } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { UsuarioService } from 'src/app/services/usuario.service';

@Component({
  selector: 'app-adduser',
  templateUrl: './adduser.component.html',
  styleUrls: ['./adduser.component.css']
})
export class AdduserComponent implements OnInit {
  emailPattern = "^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$";
  erroru = false;
  errorc = false;
  userForm: FormGroup = this.formBuilder.group({
    nickname: ['', Validators.required, Validators.pattern("^[a-z0-9_-]{8,15}$/")],
    nombre: ['', Validators.required, Validators.pattern("/^[a-zA-Z\_\-]{4,16}$/")],
    apellido: ['', Validators.required, Validators.pattern("/[a-zA-Z0-9\_\-]{4,16}$/")],
    password: ['', Validators.required],
    email: ['', Validators.required, Validators.pattern(this.emailPattern)],
    rol: ['', Validators.required],
    descripcion: ['']
  });

  constructor(private formBuilder: FormBuilder, public service: UsuarioService, private router: Router) { }

  ngOnInit(): void {
    this.userForm.reset();
    this.errorc = false;
    this.erroru = false;
  }

  onSubmit(): void {
    this.errorc = false;
    this.service.clearFormData();
    this.service.formData = {
      nickname: this.userForm.value.nickname,
      nombre: this.userForm.value.nombre,
      apellido: this.userForm.value.apellido,
      password: this.userForm.value.password,
      email: this.userForm.value.email,
      user_foto: "img/profile.png",
      active: true,
      token: "",
      rol: this.userForm.value.rol,
      user_descripcion: this.userForm.value.descripcion,
    };
    this.insertRecord();
  }

  insertRecord() {
    this.service.postUser(this.service.formData).subscribe(
      res => {
        //MOSTRAR UN MENSAJE QUE SE GUARDO CORRECTAMENTE
        this.router.navigate(['/admusers']);
        this.userForm.reset();
      },
      (err: HttpErrorResponse) => {

        var MensajeError = err.error.ModelState.toString();
        //console.log(err);
       console.log(MensajeError);
        if (MensajeError == "EL MAIL YA SE ENCUENTRA EN LA BASE DE DATOS") {
          this.errorc = true;
          this.userForm.reset();
        }
        else {
          if (MensajeError == "EL NICKNAME YA SE ENCUENTRA EN LA BASE DE DATOS") {
            this.erroru = true;
            this.userForm.reset();
          } else {
            console.log('algo malio sal');
            this.userForm.reset();
          }
        }
        this.router.navigate(['/adduser']);
      }
    );
  }
}