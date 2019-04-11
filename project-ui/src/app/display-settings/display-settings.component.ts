import { Component, OnInit } from '@angular/core';
import { DataService } from '../services/data-service.service';

@Component({
  selector: 'app-display-settings',
  templateUrl: './display-settings.component.html',
  styleUrls: ['./display-settings.component.css']
})
export class DisplaySettingsComponent implements OnInit {

  constructor(private dataService: DataService) { }

  ngOnInit() {
    this.dataService.getData();
  }

}
