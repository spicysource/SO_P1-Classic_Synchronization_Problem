#ifndef SPINLOCK_H
#define SPINLOCK_H

#include <atomic>
 
class Spinlock
{
public:
    void lock()
    {
        while(lck.test_and_set(std::memory_order_acquire))
        {}
    }
 
    void unlock()
    {
        lck.clear(std::memory_order_release);
    }
 
private:
    std::atomic_flag lck = ATOMIC_FLAG_INIT;
};

#endif