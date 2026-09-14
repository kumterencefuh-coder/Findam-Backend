# Findam backend

Small dependency-free Node.js API for the Findam frontend. It stores data in `data/db.json` and is intended to be easy to replace with PostgreSQL later.

## Run

```bash
npm start
```

From the project root, you can also run `npm run backend`.

The API runs on `http://localhost:4000` by default. Set `PORT` and `FRONTEND_ORIGIN` as environment variables when needed.

## Endpoints

- `GET /api/health`
- `GET /api/listings?city=Buea&type=Rent&maxPrice=200&q=molyko`
- `GET /api/listings/:id`
- `POST /api/listings` — landlord submission
- `GET /api/submissions`
- `GET /api/favorites?visitorId=...`
- `POST /api/favorites/:listingId` with `{ "visitorId": "..." }`
- `DELETE /api/favorites/:listingId?visitorId=...`
- `POST /api/bot` with `{ "message": "..." }`

The write endpoints validate input and return JSON errors with consistent status codes.

## Create the first admin account

Set these backend environment variables before starting the backend:

```env
ADMIN_EMAIL=admin@findam.com
ADMIN_PASSWORD=use-a-long-unique-password
ADMIN_NAME=Findam Admin
```

On startup, Findam creates the account with `role: admin` and stores only a hashed password. Do not add an admin role to the registration form or expose these variables in the frontend. Then log in through the normal Findam login form using the configured email and password; the backend routes the account to the Admin Portal. If the account already exists, changing these variables will not overwrite it.
