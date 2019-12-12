import { Component, OnChanges, Input } from '@angular/core';

import { FxQuote } from '../fx-quote';

interface Point {
  x: number;
  y: number;
}

@Component({
  selector: 'app-pair-history-chart',
  templateUrl: './pair-history-chart.component.html'
})
export class PairHistoryChartComponent implements OnChanges {
  @Input() width: number;
  @Input() height: number;
  @Input() quotes: FxQuote[];
  @Input() pair: string;

  margin = 8;

  points: Point[];
  segments: Point[][];

  ngOnChanges() {
    const quotes = this.quotes
      .filter(q => q.timestamp > 0);
    const bids: number[] = quotes.map(q => parseFloat(q.bid));
    const timestamps: number[] = quotes.map(q => q.timestamp);

    const minBid = Math.min(...bids);
    const maxBid = Math.max(...bids);

    const minTimestamp = Math.min(...timestamps);
    const maxTimestamp = Math.max(...timestamps);

    const scaleTimestamps = (this.width - 2 * this.margin) /
      Math.max(1, maxTimestamp - minTimestamp);

    const scaleBids = (this.height - 2 * this.margin) /
      Math.max(0.000001, maxBid - minBid);

    this.points = quotes
      .map(q => ({
        x: this.margin + (q.timestamp - minTimestamp) * scaleTimestamps,
        y: this.margin + (parseFloat(q.bid) - minBid) * scaleBids
      }));

    this.segments = this.points.slice(1).map((p, index) =>
     [this.points[index], p]);
  }
}
