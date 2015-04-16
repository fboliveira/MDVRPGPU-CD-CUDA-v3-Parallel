/*
 * Managed.h
 *
 *  Created on: Apr 16, 2015
 *      Author: Fernando B Oliveira - fboliveira25@gmail.com
 *
 *  Description:
 *	
 */

// Adapted from https://github.com/parallel-forall/code-samples/tree/master/posts/unified-memory

#ifndef MANAGED_H_
#define MANAGED_H_

#include <cuda_runtime.h>

class Managed
{
public:
  void *operator new(size_t len) {
    void *ptr;
    cudaMallocManaged(&ptr, len);
    return ptr;
  }

  void operator delete(void *ptr) {
    cudaFree(ptr);
  }
};

#endif /* MANAGED_H_ */
