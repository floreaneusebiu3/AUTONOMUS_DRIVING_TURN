import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterOutlet } from '@angular/router';
import { MatChipsModule } from '@angular/material/chips';
import { TimeCardComponent } from './components/time-card/time-card.component';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [CommonModule, RouterOutlet, MatChipsModule, TimeCardComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.scss'
})
export class AppComponent implements OnInit {
  title = 'viraj-frontend';
  websocket = new WebSocket("ws://localhost:8080");
  data1: string[] = [];
  data2: string[] = [];
  images: string[] = [];
  allowedStatus: boolean[] = [];
  selectedScenario = 0;

  ngOnInit(): void {
    this.websocket.addEventListener('open', () => {
      console.log('we are connected');
    })

    this.websocket.addEventListener('message', ({ data }) => {
      this.cleanData();
      let lines = data.split("\n");
      for (let i = 0; i < lines.length; i += 2) {
        if (lines[i + 1]) {
          lines[i + 1].includes("allowed") ? this.allowedStatus.push(true) : this.allowedStatus.push(false);
          this.data1.push(lines[i]);
          this.data2.push(lines[i + 1]);
          this.images.push(`assets/S${this.selectedScenario}C${this.data1.length}.png`)
        }
      } 
    })
  }

  private cleanData(): void {
    this.data1 = [];
    this.allowedStatus = [];
    this.images = [];
  }

  sendScenario1Request() {
    this.selectedScenario = 1;
    this.websocket.send("sc1");
  }

  sendScenario2Request() {
    this.selectedScenario = 2;
    this.websocket.send("sc2");
  }

  sendScenario3Request() {
    this.selectedScenario = 3;
    this.websocket.send("sc3");
  }

  sendScenario4Request() {
    this.selectedScenario = 4;
    this.websocket.send("sc4");
  }
}
