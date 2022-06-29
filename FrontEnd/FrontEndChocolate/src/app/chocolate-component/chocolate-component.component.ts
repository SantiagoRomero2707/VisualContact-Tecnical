import { FormBuilder, FormGroup } from '@angular/forms';
import { Component, OnInit } from '@angular/core';
import { RestService } from '../rest.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-chocolate-component',
  templateUrl: './chocolate-component.component.html',
  styleUrls: ['./chocolate-component.component.css']
})

export class ChocolateComponentComponent implements OnInit {
  title = 'Chocolate Fest';
  public form!: FormGroup;
  
  constructor(private router:Router, private RestService:RestService, private formBuilder: FormBuilder){}
  ngOnInit(): void {
    // this.cargarData();
    this.form = this.formBuilder.group({
      cantidadGastarTotal: [''],
      precioUnitarioChocolate: [''],
      envolturasChocolate: ['']
    })      
  }


  
  public enviarData(){
    this.RestService.post(`http://192.168.10.18:5000/sales/invoice`,
    {
      Cantidad_Total: this.form.value.cantidadGastarTotal,
      Precio_Unitario: this.form.value.precioUnitarioChocolate,
      Envolturas_Promocion: this.form.value.envolturasChocolate
    })
    .subscribe(respuesta =>{
      console.log(respuesta,'comentario envíado');
      // this.form.reset()
      this.mostrarResult();
    })
  }

  public volverHome(){
    this.router.navigate([''])  // Volver a la página principal
  }

  public mostrarResult(){
    this.router.navigate(['Result'])  // Volver a la página principal
  }
}
