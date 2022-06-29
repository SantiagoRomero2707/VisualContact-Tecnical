import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ChocolateComponentComponent } from './chocolate-component.component';

describe('ChocolateComponentComponent', () => {
  let component: ChocolateComponentComponent;
  let fixture: ComponentFixture<ChocolateComponentComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ChocolateComponentComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ChocolateComponentComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
