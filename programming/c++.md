C++
===

## Concurrency


### threads locks

```c++

	lock_guard

	unique_lock
		unique_lock lk { m }
		unique_lock lk { m, defer_lock }
		unique_lock lk { m, try_to_lock }

		lk.lock();		lk.unlock();		lk.release();


	// Multiple lock: Avoid deadlock using lock()
	
	unique_lock lk1 { m1, defer_lock };
	unique_lock lk2 { m2, defer_lock };

	lock( lk1, lk2 );

	// Note! You must release the locks when using lock() this way
```

### Conditional variables

```c++
	condition_variable cv {};

	cv.wait( lk );
	cv.wait( lk, PRED_FN );
	cv.wait_until( lk, tp )
	cv.wait_for(lk, d );
```

### Futures and Promises

```c++
	packaged_task<F>
	promise<T>
	future<T>
	shared_future<T>
```


