//
//  ReduxKitReactiveKit.swift
//  ReduxKitReactiveKit
//
//  Created by Karl Bowden on 20/12/2015.
//  Copyright © 2015 ReduxKit. All rights reserved.
//

import ReactiveKit
import ReduxKit

/**

 Uses `createStateStream` to create a `ReduxKit.Store<State>` using a
 `ReactiveKit.Observable<State>` stream.

 */
public func createStore<State>(
    reducer: ((State?, Action) -> State),
    state: State? = nil)
    -> Store<State> {

        return createStreamStore(createStream, reducer: reducer, state: nil)
}


/**

 Accepts a `State` and returns `ReduxKit.StateStream<State>` using a
 `ReactiveKit.Observable<State>` as the stream provider.

 */
public func createStream<State>(state: State) -> StateStream<State> {
    let observable = Observable(state)

    func subscribe(subscriber: State -> ()) -> ReduxDisposable {
        return createDisposable(observable.observe(observer: subscriber))
    }

    return StateStream(dispatch: observable.next, subscribe: subscribe, getState: { observable.value })
}


/**

 Accepts a `ReactiveKit.DisposableType` and returns it wrapped as a `ReduxDisposable`.

 */
public func createDisposable(disposable: DisposableType) -> ReduxDisposable {
    return SimpleReduxDisposable(disposed: { disposable.isDisposed }, dispose: disposable.dispose)
}
