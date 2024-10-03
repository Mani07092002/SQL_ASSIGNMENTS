Task-2
2)
SELECT event_id, event_name, event_date, event_time, venue_id, total_seats, available_seats, ticket_price, event_type
FROM Event;
3)
SELECT event_id, event_name, event_date, event_time, venue_id, total_seats, available_seats, ticket_price, event_type
FROM Event
WHERE available_seats > 90;
4)
SELECT event_id, event_name, event_date, event_time, venue_id, total_seats, available_seats, ticket_price, event_type
FROM Event
WHERE event_name LIKE '%cup%';
5)
SELECT event_id, event_name, event_date, event_time, venue_id, total_seats, available_seats, ticket_price, event_type
FROM Event
WHERE ticket_price BETWEEN 1000 AND 2500;
6)
SELECT event_id, event_name, event_date, event_time, venue_id, total_seats, available_seats, ticket_price, event_type
FROM Event
WHERE event_date BETWEEN '2024-10-01' AND '2024-10-5';
7)
SELECT event_id, event_name, event_date, event_time, venue_id, total_seats, available_seats, ticket_price, event_type
FROM Event
WHERE available_seats > 0 
AND event_name LIKE '%Concert%';
8)
SELECT * 
FROM 
    Customer
ORDER BY 
    customer_id
OFFSET 5 ROWS
FETCH NEXT 5 ROWS ONLY;
9)SELECT booking_id, customer_id, event_id, num_tickets, total_cost, booking_date
FROM Booking
WHERE num_tickets > 4;
10)SELECT customer_id, customer_name, email, phone_number, booking_id
FROM Customer
WHERE phone_number LIKE '%000%';
11)SELECT event_id, event_name, event_date, total_seats, available_seats, venue_id, ticket_price
FROM Event
WHERE total_seats > 1500
ORDER BY total_seats;
12)SELECT event_id, event_name, event_date, total_seats, available_seats, venue_id, ticket_price
FROM Event
WHERE event_name NOT LIKE 'x%' 
  AND event_name NOT LIKE 'y%' 
  AND event_name NOT LIKE 'z%';