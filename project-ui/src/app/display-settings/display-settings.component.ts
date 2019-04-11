import { Component, ViewChild, OnInit } from '@angular/core';
import { DataService } from '../services/data-service.service';
import { DataDisplayComponent } from '../data-display/data-display.component';

@Component({
  selector: 'app-display-settings',
  templateUrl: './display-settings.component.html',
  styleUrls: ['./display-settings.component.css']
})
export class DisplaySettingsComponent implements OnInit {

  @ViewChild(DataDisplayComponent) child;

  constructor() { }

  ngOnInit() {
  }

  setVitesse(){
    this.child.deportationFlag = 0;
    this.child.vitesseFlag = 1;
  }

  setDeportation(){
    this.child.vitesseFlag = 0;
    this.child.deportationFlag = 1;
  }

}
