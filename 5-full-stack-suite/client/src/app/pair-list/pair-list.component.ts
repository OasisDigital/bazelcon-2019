import { Component } from '@angular/core';
import { Observable } from 'rxjs';
import { map, scan } from 'rxjs/operators';

import { FxDataService } from '../fx-data.service';
import { FxQuote } from '../fx-quote';

@Component({
  selector: 'app-pair-list',
  templateUrl: './pair-list.component.html'
})
export class PairListComponent {
  latestQuoteForEachSymbol: Observable<FxQuote[]>;

  constructor(fxDataService: FxDataService) {
    this.latestQuoteForEachSymbol = fxDataService.fxData
      .pipe(
        scan((acc: Map<string, FxQuote>, curr: FxQuote) => acc.set(curr.symbol, curr),
          new Map<string, FxQuote>()),
        map(acc => Array.from(acc.values()))
      );
  }
}
