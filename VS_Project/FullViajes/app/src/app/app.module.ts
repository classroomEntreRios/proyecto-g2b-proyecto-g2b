import { NgModule } from '@angular/core';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { BrowserModule } from '@angular/platform-browser';

// importo servicios
//import {CargarScriptsJSService} from './services/cargar-scripts-js.service';
// fin de importar servicios
import {HttpClient, HttpClientModule} from '@angular/common/http';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { FormRegistroComponent } from './component/form-registro/form-registro.component';
import { UsuarioService } from './services/usuario.service';
import { UsuarioComponent } from './component/usuario/usuario.component';
import { NavbarComponent } from './component/navbar/navbar.component';
import { FooterComponent } from './component/footer/footer.component';
import { PrincipalComponent } from './component/principal/principal.component';
import { SobreErComponent } from './component/sobre-er/sobre-er.component';
import { AddcityComponent } from './component/addcity/addcity.component';
import { AdduserComponent } from './component/adduser/adduser.component';
import { CiudadesComponent } from './component/ciudades/ciudades.component';
import { AtractivosComponent } from './component/atractivos/atractivos.component';
import { DashboardComponent } from './component/dashboard/dashboard.component';
import { ForoComponent } from './component/foro/foro.component';
import { LogoutComponent } from './component/logout/logout.component';
import { PerfileditComponent } from './component/perfiledit/perfiledit.component';
import { PerfilComponent } from './component/perfil/perfil.component';
import { PrincipalregComponent } from './component/principalreg/principalreg.component';
import { RegnavbarComponent } from './component/regnavbar/regnavbar.component';
import { SidebarComponent } from './component/sidebar/sidebar.component';
import { SidebardashComponent } from './component/sidebardash/sidebardash.component';
import { UsuariosComponent } from './component/usuarios/usuarios.component';
import { ContentinitComponent } from './component/contentinit/contentinit.component';
import { LevelaccessComponent } from './component/levelaccess/levelaccess.component';
import { ClimaComponent } from './component/clima/clima.component';

@NgModule({
  declarations: [
    AppComponent,
    FormRegistroComponent,
    UsuarioComponent,
    NavbarComponent,
    FooterComponent,
    PrincipalComponent,
    SobreErComponent,
    AddcityComponent,
    AdduserComponent,
    CiudadesComponent,
    AtractivosComponent,
    DashboardComponent,
    ForoComponent,
    LogoutComponent,
    PerfileditComponent,
    PerfilComponent,
    PrincipalregComponent,
    RegnavbarComponent,
    SidebarComponent,
    SidebardashComponent,
    UsuariosComponent,
    ContentinitComponent,
    LevelaccessComponent,
    ClimaComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    ReactiveFormsModule,
    FormsModule,
    HttpClientModule,
    AppRoutingModule
  ],
  providers: [
    UsuarioService
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
