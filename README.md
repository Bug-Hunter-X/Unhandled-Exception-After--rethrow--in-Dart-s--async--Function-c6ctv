# Unhandled Exception After `rethrow` in Dart's `async` Function

This example demonstrates a potential issue with exception handling in Dart's `async` functions when using `rethrow`.  The `fetchData` function uses `rethrow` to propagate exceptions, but the `main` function's exception handling is incomplete, leading to a potential for silent failures.

## Bug:

The primary problem lies in the interaction between `rethrow` and the lack of comprehensive error handling in the `main` function. If an exception is thrown in `fetchData`, it is re-thrown. However, the `main` function only prints the exception; it doesn't take any other action that might be appropriate for a failed API call (e.g., retry, display an error message, use default data).

## Solution:

The solution involves more robust error handling in the `main` function.  In addition to printing the error message, consider retry logic, fallback mechanisms, or more informative user feedback.