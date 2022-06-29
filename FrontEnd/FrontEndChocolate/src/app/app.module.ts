import { HttpClient, HttpClientModule } from '@angular/common/http';
import { NgModule } from '@angular/core';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HomeComponentComponent } from './home-component/home-component.component';
import { ChocolateComponentComponent } from './chocolate-component/chocolate-component.component';
import { ResponseComponentComponent } from './response-component/response-component.component';
import { Routes, RouterModule } from '@angular/router';

// Enrutamiento de los componentes
const appRoutes : Routes = [
  {path: '', component:HomeComponentComponent},
  {path: 'Chocolate', component: ChocolateComponentComponent},
  {path: 'Result', component: ResponseComponentComponent}
];

@NgModule({
  declarations: [
    AppComponent,
    HomeComponentComponent,
    ChocolateComponentComponent,
    ResponseComponentComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    FormsModule,
    ReactiveFormsModule,
    RouterModule.forRoot(appRoutes)
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
