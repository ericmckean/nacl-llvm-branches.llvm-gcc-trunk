// Copyright (C) 2000, 2002, 2003, 2004 Free Software Foundation
//
// This file is part of the GNU ISO C++ Library.  This library is free
// software; you can redistribute it and/or modify it under the
// terms of the GNU General Public License as published by the
// Free Software Foundation; either version 2, or (at your option)
// any later version.

// This library is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License along
// with this library; see the file COPYING.  If not, write to the Free
// Software Foundation, 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301,
// USA.

// 20.4.5 Template class auto_ptr [lib.auto.ptr]

#include <memory>
#include <testsuite_hooks.h>

struct A
{
  A() { ++ctor_count; }
  virtual ~A() { ++dtor_count; }
  static long ctor_count;
  static long dtor_count;
};
long A::ctor_count = 0;
long A::dtor_count = 0;

struct B : A
{
  B() { ++ctor_count; }
  virtual ~B() { ++dtor_count; }
  static long ctor_count;
  static long dtor_count;
};
long B::ctor_count = 0;
long B::dtor_count = 0;


struct reset_count_struct
{
  ~reset_count_struct()
  {
    A::ctor_count = 0;
    A::dtor_count = 0;
    B::ctor_count = 0;
    B::dtor_count = 0;
  }
};

// 20.4.5.2 auto_ptr members [lib.auto.ptr.members]

// Member access
int
test06()
{
  reset_count_struct __attribute__((unused)) reset;
  bool test __attribute__((unused)) = true;

  std::auto_ptr<A> A_from_A(new A);
  std::auto_ptr<A> A_from_A_ptr(A_from_A.release());
  VERIFY( A_from_A.get() == 0 );
  VERIFY( A_from_A_ptr.get() != 0 );
  VERIFY( A_from_A_ptr->ctor_count == 1 );
  VERIFY( (*A_from_A_ptr).dtor_count == 0 );

  A* A_ptr = A_from_A_ptr.get();

  A_from_A_ptr.reset(A_ptr);
  VERIFY( A_from_A_ptr.get() == A_ptr );
  VERIFY( A_from_A_ptr->ctor_count == 1 );
  VERIFY( (*A_from_A_ptr).dtor_count == 0 );

  A_from_A_ptr.reset(new A);
  VERIFY( A_from_A_ptr.get() != A_ptr );
  VERIFY( A_from_A_ptr->ctor_count == 2 );
  VERIFY( (*A_from_A_ptr).dtor_count == 1 );
  return 0;
}

int 
main()
{
  test06();
  return 0;
}
