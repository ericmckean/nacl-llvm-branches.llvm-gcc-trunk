/* Copyright (C) 2005  Free Software Foundation.

   by Gabriel Dos Reis  <gdr@integrable-solutions.net>  */

/* { dg-do compile }  */
/* { dg-options "-Wno-c++-compat" } */

extern const int foo = 42;      /* { dg-error "initialized and declared" } */

