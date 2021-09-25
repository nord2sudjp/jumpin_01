import 'package:flutter/material.dart';
import './models/monthly_route.dart';

const DUMMY_MONTHLY_ROUTES = const [
  MonthlyRoute(
      year: 2020,
      month: 11,
      id: 1,
      grade: 4,
      creator: 'Maka',
      topo: 'https://picsum.photos/200/300'),
  MonthlyRoute(
      year: 2020,
      month: 11,
      id: 2,
      grade: 3,
      creator: 'Tako',
      topo: 'https://picsum.photos/200/300'),
  MonthlyRoute(
      year: 2020,
      month: 12,
      id: 1,
      grade: 1,
      creator: 'Tokyo',
      topo: 'https://picsum.photos/200/300'),
  MonthlyRoute(
      year: 2020,
      month: 12,
      id: 2,
      grade: -1,
      creator: 'Shinano',
      topo: 'https://picsum.photos/200/300'),
  MonthlyRoute(
      year: 2020,
      month: 10,
      id: 1,
      grade: -1,
      creator: 'Shinano',
      topo: 'https://picsum.photos/200/300'),
];

// dbRef = database.getReference();
// dbRef.child("test").child("data").child("message1").setValue("Goodbye");
