import { Component, OnInit, ViewChild } from '@angular/core';
import { ChartDataSets, ChartOptions, ChartType } from 'chart.js';
import { Color, Label, BaseChartDirective } from 'ng2-charts'
import * as pluginAnnotations from 'chartjs-plugin-annotation';
import * as pluginDataLabels from 'chartjs-plugin-datalabels';
import { DataService } from '../services/data-service.service';

@Component({
  selector: 'app-data-display',
  templateUrl: './data-display.component.html',
  styleUrls: ['./data-display.component.css']
})
export class DataDisplayComponent implements OnInit {

  public pieData: number[];
  public vitesseFlag;
  public deportationFlag;
  public lineChartData: ChartDataSets[] = [
    {data: [], label: 'Vitesse'},
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
        }/* ,
        {
          id: 'y-axis-1',
          position: 'right',
          gridLines: {
            color: 'rgba(255,0,0,0.3)',
          },
          ticks: {
            fontColor: 'red',
          }
        } */
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
      backgroundColor: 'rgba(255,255,255,0.2)',
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


  public pieChartOptions: ChartOptions = {
    responsive: true,
    legend: {
      position: 'top',
    },
    plugins: {
      datalabels: {
        formatter: (value, ctx) => {
          const label = ctx.chart.data.labels[ctx.dataIndex];
          return label;
        },
      },
    }
  };
  public pieChartLabels: Label[] = [['Gauche'], ['Centre'], ['Droite']];
  public pieChartData: number[] = [0, 0, 0];
  public pieChartType: ChartType = 'pie';
  public pieChartLegend = true;
  public pieChartPlugins = [pluginDataLabels];
  public pieChartColors = [
    {
      backgroundColor: ['rgba(255,0,0,0.3)', 'rgba(0,255,0,0.3)', 'rgba(0,0,255,0.3)'],
    },
  ];
  @ViewChild(BaseChartDirective) chart: BaseChartDirective;

  constructor(private dataService: DataService) { 
    this.pieData = [0, 0 , 0];
  }

  ngOnInit() {
    this.vitesseFlag = 1;
    this.deportationFlag = 0;
    setInterval(async() => {
      this.lineChartData = [
        {data: [], label: 'vitesse'}
      ];
      let donnees = await this.dataService.getData();
      this.lineChartData[0].data = donnees[0].values;
      this.lineChartLabels = donnees[0].labels;

      let deportation = await this.dataService.getDeportation();
      if(deportation == 0){
        this.pieData[0] += 1;
      }
      else if(deportation == 1){
        this.pieData[1] += 1;
      }
      else {
        this.pieData[2] += 1;
      }

      console.log(this.pieData);
      console.log(this.pieChartData);
      this.pieChartData = this.pieData;
      this.pieChartLabels = [['Gauche'], ['Centre'], ['Droite']]
    }, 2000);
  }

}
