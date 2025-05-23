// RUN: %libomp-cxx-compile-and-run | FileCheck %s --match-full-lines

#ifndef HEADER
#define HEADER

#include <cstdlib>
#include <cstdio>

int main() {
  printf("do\n");
#pragma omp parallel for collapse(2) num_threads(1)
  for (int i = 0; i < 3; ++i)
#pragma omp fuse
  {
    for (int j = 0; j < 3; ++j)
      printf("i=%d j=%d\n", i, j);
    for (int k = 0; k < 3; ++k)
      printf("i=%d k=%d\n", i, k);
  }
  printf("done\n");
  return EXIT_SUCCESS;
}

#endif /* HEADER */

// CHECK:      do
// CHECK: i=0 j=0
// CHECK-NEXT: i=0 k=0
// CHECK-NEXT: i=0 j=1
// CHECK-NEXT: i=0 k=1
// CHECK-NEXT: i=0 j=2
// CHECK-NEXT: i=0 k=2
// CHECK-NEXT: i=1 j=0
// CHECK-NEXT: i=1 k=0
// CHECK-NEXT: i=1 j=1
// CHECK-NEXT: i=1 k=1
// CHECK-NEXT: i=1 j=2
// CHECK-NEXT: i=1 k=2
// CHECK-NEXT: i=2 j=0
// CHECK-NEXT: i=2 k=0
// CHECK-NEXT: i=2 j=1
// CHECK-NEXT: i=2 k=1
// CHECK-NEXT: i=2 j=2
// CHECK-NEXT: i=2 k=2
// CHECK-NEXT: done
