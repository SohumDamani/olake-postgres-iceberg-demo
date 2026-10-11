CREATE TABLE public.orders (
    id INTEGER PRIMARY KEY,
    customer_name TEXT NOT NULL,
    amount_cents INTEGER NOT NULL CHECK (amount_cents >= 0),
    status TEXT NOT NULL
        CHECK (status IN ('pending', 'paid', 'shipped', 'cancelled'))
);

INSERT INTO public.orders
    (id, customer_name, amount_cents, status)
VALUES
    (1,  'Aisha',   1000,  'paid'),
    (2,  'Ben',     2000,  'shipped'),
    (3,  'Chloe',   3000,  'pending'),
    (4,  'Diego',   4000,  'paid'),
    (5,  'Emma',    5000,  'cancelled'),
    (6,  'Farah',   6000,  'shipped'),
    (7,  'Gabriel', 7000,  'paid'),
    (8,  'Hana',    8000,  'pending'),
    (9,  'Ivan',    9000,  'shipped'),
    (10, 'Jules',   10000, 'paid'),
    (11, 'Kai',     11000, 'pending'),
    (12, 'Leila',   12000, 'paid'),
    (13, 'Mateo',   13000, 'cancelled'),
    (14, 'Nora',    14000, 'shipped'),
    (15, 'Omar',    15000, 'paid');
