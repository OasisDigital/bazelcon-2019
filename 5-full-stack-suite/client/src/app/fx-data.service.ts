import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { share } from 'rxjs/operators';

import { FxQuote } from './fx-quote';
import { SseService } from './sse.service';

@Injectable({
  providedIn: 'root'
})
export class FxDataService {
  fxData: Observable<FxQuote>;

  constructor(sse: SseService) {
    this.fxData = sse
      .observe<FxQuote>('//localhost:8005/highfreq')
      .pipe(share());
  }
}
