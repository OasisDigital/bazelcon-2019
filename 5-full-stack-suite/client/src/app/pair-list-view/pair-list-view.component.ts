import { Component, Input } from '@angular/core';

import { FxQuote } from '../fx-quote';

@Component({
  selector: 'app-pair-list-view',
  templateUrl: './pair-list-view.component.html',
  styleUrls: ['./pair-list-view.component.css']
})
export class PairListViewComponent {
  @Input() list: FxQuote[];
}
