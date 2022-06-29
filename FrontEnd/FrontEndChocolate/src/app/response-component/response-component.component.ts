import { Component, OnInit } from '@angular/core';
import { RestService } from '../rest.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-response-component',
  templateUrl: './response-component.component.html',
  styleUrls: ['./response-component.component.css']
})
export class ResponseComponentComponent implements OnInit {

  resultado! : string;

  constructor(private router:Router, private RestService:RestService) {
    this.resultado = this.resultado;
  }

  ngOnInit(): void {
    this.cargarData()
  }

  // Realizar GET de la API creada en Python Flask
  public cargarData(){
    this.RestService.get(`http://192.168.10.18:5000/sales/invoice`)
    .subscribe(respuesta =>{
      var valueFront;
      for( var value of Object.values(respuesta)){
        valueFront = value;
      }
      this.resultado = valueFront;
      })
    }

  public volverHome(){
    this.router.navigate([''])  // Volver a la página principal
  }

  public resolverProblema(){
    this.router.navigate(['/Chocolate'])  // Regrear a la calculadora principal
  }
}
