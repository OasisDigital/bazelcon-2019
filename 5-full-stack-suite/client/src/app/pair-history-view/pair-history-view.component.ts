import { Component, Input } from '@angular/core';

import { FxQuote } from '../fx-quote';

@Component({
  selector: 'app-pair-history-view',
  templateUrl: './pair-history-view.component.html',
  styleUrls: ['./pair-history-view.component.css']
})
export class PairHistoryViewComponent {
  @Input() latestQuotes: FxQuote[];
  @Input() pair: string;
}
