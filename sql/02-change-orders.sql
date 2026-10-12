BEGIN;

UPDATE public.orders
SET amount_cents = 3500, status = 'paid'
WHERE id = 3;

INSERT INTO public.orders
    (id, customer_name, amount_cents, status)
VALUES
    (16, 'Priya', 16000, 'paid');

COMMIT;
