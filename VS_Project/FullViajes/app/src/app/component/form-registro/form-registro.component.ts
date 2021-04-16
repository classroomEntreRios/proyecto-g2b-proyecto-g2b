
import { Component, OnInit } from '@angular/core';
import { HttpClient, HttpErrorResponse} from '@angular/common/http';
import { Router } from '@angular/router'; 
import { UsuarioService } from 'src/app/services/usuario.service';
import { FormBuilder, FormGroup, Validators, NgForm } from '@angular/forms';
import { NgModule, CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';


@Component({
  selector: 'app-form-registro',
  templateUrl: './form-registro.component.html',
  styleUrls: ['./form-registro.component.css']
})
export class FormRegistroComponent implements OnInit {
  erroru=false;
  errorc=false;

  constructor(public service: UsuarioService, private router:Router) {
    

}



  ngOnInit(): void {
    this.resetForm();
  }

  resetForm(form?: NgForm) {
    if (form != null)
      form.resetForm();
    //quitar los alerts ya que aparecen al vaciar todo
    this.erroru=false;
    this.errorc=false;

    

    this.service.formData = {
      nombre: '',
      apellido: '',
      nickname: '',
      email: '',
      password: '',
      rol: 1,
      active: false,
      token: '',
      user_foto: '',
      user_descripcion: '',
    };
  }

   onSubmit(form: NgForm) {
    this.erroru=false;
    this.errorc=false;
    this.insertRecord(form);
  }

  insertRecord(form : NgForm){
        this.service.postUsuario(form.value)
        .subscribe(
          res => { 
            this.resetForm(form);
            this.resetForm();
            //MOSTRAR UN MENSAJE QUE SE GUARDO CORRECTAMENTE
            this.router.navigate(['/usuario']);
          },
          (err:HttpErrorResponse) => {
              
            var MensajeError=err.error.Message;
            if (MensajeError=="El usuario ya se encuentra registrado")
                {
                    this.erroru=true;
                }
                else
                {
                    if (MensajeError=="El correo ya se encuentra registrado")
                    {
                        this.errorc=true;
                    } 
                    else {console.log('algo malio sal');
                      //MOSTRAR UN ERROR GENERAL POR FORMULARIO INVALIDO
                      //this.resetForm();
                      //this.router.navigate(['/usuario']);
                    }
                }
                this.router.navigate(['/formulario']);
            }
          );
        
        //this.router.navigate(['/usuario']);
        }
  corregido(){
    this.erroru=false;
    this.errorc=false;
  }

        
   }

