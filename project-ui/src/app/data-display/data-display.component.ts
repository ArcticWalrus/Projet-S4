import { Component, OnInit, ViewChild } from '@angular/core';
import { ChartDataSets, ChartOptions } from 'chart.js';
import { Color, Label, BaseChartDirective } from 'ng2-charts'
import * as pluginAnnotations from 'chartjs-plugin-annotation';
//import { DataService } from '../services/data-service.service';

@Component({
  selector: 'app-data-display',
  templateUrl: './data-display.component.html',
  styleUrls: ['./data-display.component.css']
})
export class DataDisplayComponent implements OnInit {
  public test = 0;
  public timer: any;

  public lineChartData: ChartDataSets[] = [
    {data: [], label: 'Speed'},
  ];
  public lineChartLabels: Label[] = [];
  public lineChartOptions: (ChartOptions & { annotation: any }) = {
    responsive: true,
    scales: {
      // We use this empty structure as a placeholder for dynamic theming.
      xAxes: [{}],
      yAxes: [
        {
          id: 'y-axis-0',
          position: 'left',
        },
        {
          id: 'y-axis-1',
          position: 'right',
          gridLines: {
            color: 'rgba(255,0,0,0.3)',
          },
          ticks: {
            fontColor: 'red',
          }
        }
      ]
    },
    annotation: {
      annotations: [
        {
          type: 'line',
          mode: 'vertical',
          scaleID: 'x-axis-0',
          value: 'March',
          borderColor: 'orange',
          borderWidth: 2,
          label: {
            enabled: true,
            fontColor: 'orange',
            content: 'LineAnno'
          }
        },
      ],
    },
  };
  public lineChartColors:Array<any> = [
    { // dark grey
      backgroundColor: 'rgba(77,83,96,0.2)',
      borderColor: 'rgba(77,83,96,1)',
      pointBackgroundColor: 'rgba(77,83,96,1)',
      pointBorderColor: '#fff',
      pointHoverBackgroundColor: '#fff',
      pointHoverBorderColor: 'rgba(77,83,96,1)'
    }
  ];
  public lineChartLegend:boolean = true;
  public lineChartType:string = 'line';
  public lineChartPlugins = [pluginAnnotations];

  @ViewChild(BaseChartDirective) chart: BaseChartDirective;

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
    //this.chart.chart.update();
    
  }
}
