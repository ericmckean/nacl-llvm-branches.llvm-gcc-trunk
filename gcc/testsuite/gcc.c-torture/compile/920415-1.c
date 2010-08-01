/* APPLE LOCAL begin testsuite nested functions */
/* { dg-options "-fnested-functions" } */
/* APPLE LOCAL end testsuite nested functions */
/* LLVM LOCAL 8251263 */
/* { dg-xfail-if "" { *-*-darwin* } { "*" } { "" } } */

extern void abort (void);
extern void exit (int);

#ifndef NO_LABEL_VALUES
f ()
{
  __label__ l;
  void *x()
    {
      return &&l;
    }
  goto *x ();
  abort ();
  return;
 l:
  exit (0);
}
#else
int x;
#endif
