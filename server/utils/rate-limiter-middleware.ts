// express = require('express');
const { RateLimiterMemory } = require('rate-limiter-flexible');

let opts;
if(process.env.NODE_ENV === 'development') {
  opts = {
    points: 80,
    duration: 1
  }
} else {
  opts = {
    points: 100,
    duration: 60
  }
}

const rateLimiter = new RateLimiterMemory(opts);

function rateLimiterMiddleware(req: any, res: any, next: any) {
  const { authorization } = req.headers;
  const remoteAddress = req.ip;

  rateLimiter.consume(authorization || remoteAddress)
    .then(() => {
      next();
    })
    .catch(() => res.status(429).send('Too many requests'));
}

module.exports = rateLimiterMiddleware;
