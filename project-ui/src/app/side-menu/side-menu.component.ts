import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, FormBuilder } from '@angular/forms';
import { personalData } from '../models/personal-data'
import { DataService } from '../services/data-service.service';

@Component({
  selector: 'app-side-menu',
  templateUrl: './side-menu.component.html',
  styleUrls: ['./side-menu.component.css']
})

export class SideMenuComponent implements OnInit {

  public distance;
  public calorie;

  public fullName;
  public age;
  public poids

  profileForm : FormGroup;

  constructor(private dataService: DataService, private formBuilder: FormBuilder) {}

  ngOnInit() {

    this.fullName = localStorage.getItem('fullName');
    this.age = localStorage.getItem('age');
    this.poids = localStorage.getItem('poids');
    //let flag = localStorage.getItem('flag');
    
    this.profileForm = this.formBuilder.group({
      fullName: [''],
      age:[''],
      poids:['']
    })

    this.getData();
  }

  async updateInfo() {
    //console.log(this.profileForm);
    localStorage.setItem('fullName', this.profileForm.value.fullName);
    localStorage.setItem('age', this.profileForm.value.age);
    localStorage.setItem('poids', this.profileForm.value.poids);

    //await this.dataService.postPoids(this.profileForm.value.poids);

    await window.location.reload();
  }

  getData() {
    setInterval(() => {
      this.distance = this.dataService.getDistance();
      this.calorie = this.dataService.getCalorie();
      console.log("distance :" + this.distance);
      console.log("Calorie : " + this.calorie);
    }, 2000);
  }
}
