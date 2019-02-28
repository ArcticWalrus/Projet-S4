import { Component, OnInit, ViewChild } from '@angular/core';
import { BaseChartDirective } from 'ng2-charts/ng2-charts'
//import { DataService } from '../services/data-service.service';

@Component({
  selector: 'app-data-display',
  templateUrl: './data-display.component.html',
  styleUrls: ['./data-display.component.css']
})
export class DataDisplayComponent implements OnInit {
  @ViewChild(BaseChartDirective) chart: BaseChartDirective;
  public test = 0;
  public timer: any;
  public lineChartData:Array<any> = [
    {data: [], label: 'Speed'},
    /* {data: [28, 48, 40, 19, 86, 27, 90], label: 'Series B'},
    {data: [18, 48, 77, 9, 100, 27, 40], label: 'Series C'} */
  ];
  public lineChartLabels:Array<any> = [];
  public lineChartOptions:any = {
    responsive: true
  };
  public lineChartColors:Array<any> = [
    { // grey
      backgroundColor: 'rgba(148,159,177,0.2)',
      borderColor: 'rgba(148,159,177,1)',
      pointBackgroundColor: 'rgba(148,159,177,1)',
      pointBorderColor: '#fff',
      pointHoverBackgroundColor: '#fff',
      pointHoverBorderColor: 'rgba(148,159,177,0.8)'
    }
  ];
  public lineChartLegend:boolean = true;
  public lineChartType:string = 'line';

  constructor(/* private dataService: DataService */) { 

  }

  ngOnInit() {
    console.log("linechartdata on init : " + this.lineChartData);
    let _this = this;
    let lineChartDataBuffer:Array<any> = [{data: [], label: 'speed'}];
    let labelsBuffer:Array<any> = Array.from(Array(31).keys());
    this.timer = setInterval(function() {
      _this.generateRandom(lineChartDataBuffer, labelsBuffer);
    }, 2000)
  }

  public max = 15;
  public min = 0;
  public compteur = 0;
  generateRandom(dataBuffer, labBuffer): void{

    //console.log("linechartdata in random : " +this.lineChartData);
    //console.log("linechartdata.data : " + this.lineChartData[0].data[0]);
    //dataBuffer[0].data.push(Math.floor(Math.random()*(this.max-this.min+1)+this.min));
    dataBuffer[0].data.push(Math.floor(Math.random()*(this.max-this.min+1)+this.min)); //Math.floor(Math.random()*(this.max-this.min+1)+this.min);
    this.compteur++;
    this.lineChartData = dataBuffer;
    this.lineChartLabels = labBuffer.slice(1,this.compteur);
    console.log("\n\nlinechartlabels after : ");
    console.log(this.lineChartLabels);
    console.log("\n\nlinechartdata after : ");
    console.log(this.lineChartData);
    this.chart.chart.update();
    
  }
}
