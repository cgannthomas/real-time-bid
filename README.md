# RealTimeBid Laravel Backend - Machine Test

## Requirements
- Docker & docker-compose
- PHP 8.1+ (if running locally)
- Composer

## Setup (Docker)
1. copy `.env.example` to `.env` and set DB credentials if needed
2. Build & start:
   docker-compose up --build -d
3. Install composer dependencies (inside app container if necessary)
4. Run migrations & seed:
   docker-compose exec app php artisan migrate --seed
5. Start queue worker & scheduler (docker-compose includes worker & scheduler services):
   docker-compose up worker scheduler

## Running locally (w/o Docker)
- Use queue; set QUEUE_CONNECTION=sync.
- Run:
  php artisan migrate --seed
  php artisan queue:work
  php artisan schedule:work

## Auth
- Login with `/api/sanctum/token` (POST: email, password)
- Use returned token as Bearer token in `Authorization` header.

## Important endpoints
- GET /api/ad-slots?status=open|upcoming|closed|awarded
- POST /api/ad-slots/{id}/bid  (auth)   body: { amount }
- GET /api/ad-slots/{id}/bids
- GET /api/ad-slots/{id}/winner
- GET /api/me/bids

## How evaluation happens
- Scheduler runs every minute (see `routes\console.php`) and:
  - flips `upcoming`→`open`, `open`→`closed`
  - finds ended slots and dispatches EvaluateSlotJob
- EvaluateSlotJob does a DB transaction + `SELECT ... FOR UPDATE` to avoid race conditions, selects highest bid (amount desc, earliest created_at wins on tie), writes `winners` row and marks slot `awarded`.

## Sample credentials
admin@example.com / password
user1@example.com / password

## Notes
- To change queue driver to `database`, set QUEUE_CONNECTION=database and run `php artisan queue:table && php artisan migrate`.


## Files included
- Postman collection (see `post-man-collection`)
    - exported local collection (see `real-time-app.postman_collection.json`)
    - collection which can use for fresh importing (see `postman-collection.json`)
- Database with data
    - exported database (see `realtime_app.sql`)
