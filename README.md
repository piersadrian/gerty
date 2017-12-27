# HAL: A Treacherous Computer

HAL is an HTTP server you can't trust.

Named after the [ship computer from _2001: A Space Odyssey_](https://en.wikipedia.org/wiki/HAL_9000), HAL exposes API endpoints that are unreliable and broken. It's useful as a testbed for programming against remote services on faulty or unreliable network connections.

Most of the time, HAL will respond to requests with valid data in a timely manner. But not always. Sometimes, HAL will respond with invalid or incomplete data or an illegal HTTP response code. Other times it will drop a connection or hang for longer than any sensible web service should.

It's a good way to test that your gateway code is resilient to some real-world failure modes.

## API Documentation

**List Samples**

`GET /api/stats -> JSON`

Sample response body:

```
[
  {
    "sampled_at": "2017-06-05T12:49:43Z",
    "count": 17
  },
  ...
]
```

Notes:

```
This endpoint will respond with a random number of Sample elements in the response array.
```

---
