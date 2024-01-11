import { CommonModule } from '@angular/common';
import { Component, Input, OnInit } from '@angular/core';

@Component({
  selector: 'app-time-card',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './time-card.component.html',
  styleUrl: './time-card.component.scss'
})
export class TimeCardComponent {
  @Input() allowed: boolean = true;
  @Input() imagePath : string = '';
  @Input() message1 : string = '';
  @Input() message2 : string = '';
}
