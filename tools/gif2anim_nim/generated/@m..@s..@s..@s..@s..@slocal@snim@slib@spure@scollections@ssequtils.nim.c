/* Generated by Nim Compiler v2.0.0 */
#define NIM_INTBITS 64

#include "nimbase.h"
#include <sys/types.h>
                          #include <pthread.h>
#undef LANGUAGE_C
#undef MIPSEB
#undef MIPSEL
#undef PPC
#undef R3000
#undef R4000
#undef i386
#undef linux
#undef mips
#undef near
#undef far
#undef powerpc
#undef unix
typedef struct tySequence__kasHz6xCB274qU5KlcPRmQ tySequence__kasHz6xCB274qU5KlcPRmQ;
typedef struct TGenericSeq TGenericSeq;
typedef struct tyObject_PatterncolonObjectType___kYKDtfqk0BT2oNg7UWsCIA tyObject_PatterncolonObjectType___kYKDtfqk0BT2oNg7UWsCIA;
typedef struct TNimType TNimType;
typedef struct TNimNode TNimNode;
typedef struct tyObject_Cell__63almy5QgAJFi8PFYiqhQg tyObject_Cell__63almy5QgAJFi8PFYiqhQg;
typedef struct tyObject_CellSeq__bujfeOTzwHFbmRmN0zU6RQ tyObject_CellSeq__bujfeOTzwHFbmRmN0zU6RQ;
typedef struct tyObject_GcHeap__hU8qDj9ctryZt6O9ctH4Uurw tyObject_GcHeap__hU8qDj9ctryZt6O9ctH4Uurw;
typedef struct tyObject_GcStack__5Jf9cJyzaMIxrKMLnyxaiGA tyObject_GcStack__5Jf9cJyzaMIxrKMLnyxaiGA;
typedef struct tyObject_MemRegion__OpCfV5GspAy4Q4C9b5AsjaQ tyObject_MemRegion__OpCfV5GspAy4Q4C9b5AsjaQ;
typedef struct tyObject_SmallChunk__qtqzCmp59akLw6PRO9csZi6g tyObject_SmallChunk__qtqzCmp59akLw6PRO9csZi6g;
typedef struct tyObject_BigChunk__wwkt2XfgLqemnJfqobXJCA tyObject_BigChunk__wwkt2XfgLqemnJfqobXJCA;
typedef struct tyObject_LLChunk__KyTbA2GUtksg9cw11QC3K9cA tyObject_LLChunk__KyTbA2GUtksg9cw11QC3K9cA;
typedef struct tyObject_IntSet__SL2iw5WNZWqATwFRPQ9anRQ tyObject_IntSet__SL2iw5WNZWqATwFRPQ9anRQ;
typedef struct tyObject_Trunk__GYgYmq2aWFeorc87RVhDow tyObject_Trunk__GYgYmq2aWFeorc87RVhDow;
typedef struct tyObject_AvlNode__VSM8JG6dRWD0PKS4ce9c9bVw tyObject_AvlNode__VSM8JG6dRWD0PKS4ce9c9bVw;
typedef struct tyObject_HeapLinks__D3tV4wzSpbYBW5VgWk8HWg tyObject_HeapLinks__D3tV4wzSpbYBW5VgWk8HWg;
typedef struct tyTuple__9bYV9cmzxYXDLUduWt8C6m5A tyTuple__9bYV9cmzxYXDLUduWt8C6m5A;
typedef struct tyObject_GcStat__NCDcyuvMlLZWKDWNVRXsBw tyObject_GcStat__NCDcyuvMlLZWKDWNVRXsBw;
typedef struct tyObject_CellSet__CyyvQ9aZ1LQCSJB6tdYa3VA tyObject_CellSet__CyyvQ9aZ1LQCSJB6tdYa3VA;
typedef struct tyObject_PageDesc__ZlaRbq6Euq9b9bp1FP5Oma2w tyObject_PageDesc__ZlaRbq6Euq9b9bp1FP5Oma2w;
typedef struct tyObject_SharedList__9aVRzsva1TP9c4ov7rPE9aM6A tyObject_SharedList__9aVRzsva1TP9c4ov7rPE9aM6A;
typedef struct tyObject_SharedListNodecolonObjectType___DQbj9aQNoS4zQ2rhMtKnKgw tyObject_SharedListNodecolonObjectType___DQbj9aQNoS4zQ2rhMtKnKgw;
typedef struct RootObj RootObj;
typedef struct NimStringDesc NimStringDesc;
typedef struct tyObject_Value__eFHG7xUHF3nm4gy19bWHtZA tyObject_Value__eFHG7xUHF3nm4gy19bWHtZA;
typedef struct tySequence__sM4lkSb7zS6F7OVMvW9cffQ tySequence__sM4lkSb7zS6F7OVMvW9cffQ;
typedef struct tyObject_HSlice__M59bWryXDzi9cuLaUQXWQ7fg tyObject_HSlice__M59bWryXDzi9cuLaUQXWQ7fg;
typedef struct tySequence__IcY9aBeQTf9aVLLxfaauqmxg tySequence__IcY9aBeQTf9aVLLxfaauqmxg;
typedef struct tyObject_OptioncolonObjectType___6fMbuSGusnPF74lMDzIxiw tyObject_OptioncolonObjectType___6fMbuSGusnPF74lMDzIxiw;
typedef struct tyObject_ChildPatterncolonObjectType___9bvp3RoD6NHV7MK1aFzPANw tyObject_ChildPatterncolonObjectType___9bvp3RoD6NHV7MK1aFzPANw;
struct TGenericSeq {
	NI len;
	NI reserved;
};
typedef NU8 tyEnum_TNimKind__s6ZcSDNFp3kckyTmY9aSLZg;
typedef NU8 tySet_tyEnum_TNimTypeFlag__aoWLvMcfLzvUu4CDTz9artQ;
typedef N_NIMCALL_PTR(void, tyProc__ojoeKfW4VYIm36I9cpDTQIg) (void* p_p0, NI op_p1);
typedef N_NIMCALL_PTR(void*, tyProc__WSm2xU5ARYv9aAR4l0z9c9auQ) (void* p_p0);
struct TNimType {
	NI size;
	NI align;
	tyEnum_TNimKind__s6ZcSDNFp3kckyTmY9aSLZg kind;
	tySet_tyEnum_TNimTypeFlag__aoWLvMcfLzvUu4CDTz9artQ flags;
	TNimType* base;
	TNimNode* node;
	void* finalizer;
	tyProc__ojoeKfW4VYIm36I9cpDTQIg marker;
	tyProc__WSm2xU5ARYv9aAR4l0z9c9auQ deepcopy;
};
typedef NU8 tyEnum_TNimNodeKind__9aly59b39a9aIjsOj9adkT4M1QA;
struct TNimNode {
	tyEnum_TNimNodeKind__9aly59b39a9aIjsOj9adkT4M1QA kind;
	NI offset;
	TNimType* typ;
	NCSTRING name;
	NI len;
	TNimNode** sons;
};
struct tyObject_Cell__63almy5QgAJFi8PFYiqhQg {
	NI refcount;
	TNimType* typ;
};
struct tyObject_GcStack__5Jf9cJyzaMIxrKMLnyxaiGA {
	void* bottom;
};
struct tyObject_CellSeq__bujfeOTzwHFbmRmN0zU6RQ {
	NI len;
	NI cap;
	tyObject_Cell__63almy5QgAJFi8PFYiqhQg** d;
};
typedef tyObject_SmallChunk__qtqzCmp59akLw6PRO9csZi6g* tyArray__ygVi5wCyoCY6OXI2AEndjQ[256];
typedef NU32 tyArray__BHbOSqU1t9b3Gt7K2c6fQig[24];
typedef tyObject_BigChunk__wwkt2XfgLqemnJfqobXJCA* tyArray__OClnLO72XvY2UoLbp3TpiQ[32];
typedef tyArray__OClnLO72XvY2UoLbp3TpiQ tyArray__kLNW9b22YJs5xi9c3fxrNkfA[24];
typedef tyObject_Trunk__GYgYmq2aWFeorc87RVhDow* tyArray__nzygcG1uMYHwJCNhbui8rQ[256];
struct tyObject_IntSet__SL2iw5WNZWqATwFRPQ9anRQ {
	tyArray__nzygcG1uMYHwJCNhbui8rQ data;
};
typedef tyObject_AvlNode__VSM8JG6dRWD0PKS4ce9c9bVw* tyArray__WeBaoQqBxq9aV7dGzFXOcSw[2];
struct tyObject_AvlNode__VSM8JG6dRWD0PKS4ce9c9bVw {
	tyArray__WeBaoQqBxq9aV7dGzFXOcSw link;
	NI key;
	NI upperBound;
	NI level;
};
struct tyTuple__9bYV9cmzxYXDLUduWt8C6m5A {
tyObject_BigChunk__wwkt2XfgLqemnJfqobXJCA* Field0;
NI Field1;
};
typedef tyTuple__9bYV9cmzxYXDLUduWt8C6m5A tyArray__4jMf9a1MuYCcq29c6Nh58uzg[30];
struct tyObject_HeapLinks__D3tV4wzSpbYBW5VgWk8HWg {
	NI len;
	tyArray__4jMf9a1MuYCcq29c6Nh58uzg chunks;
	tyObject_HeapLinks__D3tV4wzSpbYBW5VgWk8HWg* next;
};
struct tyObject_MemRegion__OpCfV5GspAy4Q4C9b5AsjaQ {
	NI minLargeObj;
	NI maxLargeObj;
	tyArray__ygVi5wCyoCY6OXI2AEndjQ freeSmallChunks;
	NU32 flBitmap;
	tyArray__BHbOSqU1t9b3Gt7K2c6fQig slBitmap;
	tyArray__kLNW9b22YJs5xi9c3fxrNkfA matrix;
	tyObject_LLChunk__KyTbA2GUtksg9cw11QC3K9cA* llmem;
	NI currMem;
	NI maxMem;
	NI freeMem;
	NI occ;
	NI lastSize;
	tyObject_IntSet__SL2iw5WNZWqATwFRPQ9anRQ chunkStarts;
	tyObject_AvlNode__VSM8JG6dRWD0PKS4ce9c9bVw* root;
	tyObject_AvlNode__VSM8JG6dRWD0PKS4ce9c9bVw* deleted;
	tyObject_AvlNode__VSM8JG6dRWD0PKS4ce9c9bVw* last;
	tyObject_AvlNode__VSM8JG6dRWD0PKS4ce9c9bVw* freeAvlNodes;
	NIM_BOOL lockActive;
	NIM_BOOL locked;
	NIM_BOOL blockChunkSizeIncrease;
	NI nextChunkSize;
	tyObject_AvlNode__VSM8JG6dRWD0PKS4ce9c9bVw bottomData;
	tyObject_HeapLinks__D3tV4wzSpbYBW5VgWk8HWg heapLinks;
};
struct tyObject_GcStat__NCDcyuvMlLZWKDWNVRXsBw {
	NI stackScans;
	NI cycleCollections;
	NI maxThreshold;
	NI maxStackSize;
	NI maxStackCells;
	NI cycleTableSize;
	NI64 maxPause;
};
struct tyObject_CellSet__CyyvQ9aZ1LQCSJB6tdYa3VA {
	NI counter;
	NI max;
	tyObject_PageDesc__ZlaRbq6Euq9b9bp1FP5Oma2w* head;
	tyObject_PageDesc__ZlaRbq6Euq9b9bp1FP5Oma2w** data;
};
typedef long tyArray__B71stzPvuTXMbmiYmn9brGQ[5];
struct tyObject_SharedList__9aVRzsva1TP9c4ov7rPE9aM6A {
	tyObject_SharedListNodecolonObjectType___DQbj9aQNoS4zQ2rhMtKnKgw* head;
	tyObject_SharedListNodecolonObjectType___DQbj9aQNoS4zQ2rhMtKnKgw* tail;
	pthread_mutex_t lock;
};
struct tyObject_GcHeap__hU8qDj9ctryZt6O9ctH4Uurw {
	tyObject_GcStack__5Jf9cJyzaMIxrKMLnyxaiGA stack;
	NI cycleThreshold;
	NI zctThreshold;
	tyObject_CellSeq__bujfeOTzwHFbmRmN0zU6RQ zct;
	tyObject_CellSeq__bujfeOTzwHFbmRmN0zU6RQ decStack;
	tyObject_CellSeq__bujfeOTzwHFbmRmN0zU6RQ tempStack;
	NI recGcLock;
	tyObject_MemRegion__OpCfV5GspAy4Q4C9b5AsjaQ region;
	tyObject_GcStat__NCDcyuvMlLZWKDWNVRXsBw stat;
	tyObject_CellSet__CyyvQ9aZ1LQCSJB6tdYa3VA marked;
	tyObject_CellSeq__bujfeOTzwHFbmRmN0zU6RQ additionalRoots;
	tyObject_SharedList__9aVRzsva1TP9c4ov7rPE9aM6A toDispose;
	NI gcThreadId;
};
struct RootObj {
TNimType* m_type;
};
struct NimStringDesc {
  TGenericSeq Sup;
	NIM_CHAR data[SEQ_DECL_SIZE];
};
typedef NU8 tyEnum_ValueKind__ivuWq1snFNc6vWqvexh1Vw;
struct tyObject_Value__eFHG7xUHF3nm4gy19bWHtZA {
	tyEnum_ValueKind__ivuWq1snFNc6vWqvexh1Vw kind;
union{
struct {	NIM_BOOL bool_v;
} _kind_2;
struct {	NI int_v;
} _kind_3;
struct {	NimStringDesc* str_v;
} _kind_4;
struct {	tySequence__sM4lkSb7zS6F7OVMvW9cffQ* list_v;
} _kind_5;
};
};
struct tyObject_PatterncolonObjectType___kYKDtfqk0BT2oNg7UWsCIA {
  RootObj Sup;
	NimStringDesc* m_name;
	tyObject_Value__eFHG7xUHF3nm4gy19bWHtZA value;
	NIM_BOOL has_children;
	tySequence__kasHz6xCB274qU5KlcPRmQ* children;
};
struct tyObject_HSlice__M59bWryXDzi9cuLaUQXWQ7fg {
	NI a;
	NI b;
};
struct tyObject_ChildPatterncolonObjectType___9bvp3RoD6NHV7MK1aFzPANw {
  tyObject_PatterncolonObjectType___kYKDtfqk0BT2oNg7UWsCIA Sup;
};
struct tyObject_OptioncolonObjectType___6fMbuSGusnPF74lMDzIxiw {
  tyObject_ChildPatterncolonObjectType___9bvp3RoD6NHV7MK1aFzPANw Sup;
	NimStringDesc* short_0;
	NimStringDesc* long_0;
	NI argcount;
};
struct tySequence__kasHz6xCB274qU5KlcPRmQ {
  TGenericSeq Sup;
  tyObject_PatterncolonObjectType___kYKDtfqk0BT2oNg7UWsCIA* data[SEQ_DECL_SIZE];
};
struct tySequence__IcY9aBeQTf9aVLLxfaauqmxg {
  TGenericSeq Sup;
  tyObject_OptioncolonObjectType___6fMbuSGusnPF74lMDzIxiw* data[SEQ_DECL_SIZE];
};
struct tySequence__sM4lkSb7zS6F7OVMvW9cffQ {
  TGenericSeq Sup;
  NimStringDesc* data[SEQ_DECL_SIZE];
};
N_LIB_PRIVATE N_NIMCALL(TGenericSeq*, incrSeqV3)(TGenericSeq* s_p0, TNimType* typ_p1);
static N_INLINE(void, asgnRef)(void** dest_p0, void* src_p1);
static N_INLINE(void, incRef__system_u5958)(tyObject_Cell__63almy5QgAJFi8PFYiqhQg* c_p0);
static N_INLINE(NI, pluspercent___system_u786)(NI x_p0, NI y_p1);
static N_INLINE(tyObject_Cell__63almy5QgAJFi8PFYiqhQg*, usrToCell__system_u5920)(void* usr_p0);
static N_INLINE(NI, minuspercent___system_u806)(NI x_p0, NI y_p1);
static N_INLINE(void, decRef__system_u5965)(tyObject_Cell__63almy5QgAJFi8PFYiqhQg* c_p0);
static N_INLINE(NIM_BOOL, ltpercent___system_u1083)(NI x_p0, NI y_p1);
static N_INLINE(void, rtlAddZCT__system_u5963)(tyObject_Cell__63almy5QgAJFi8PFYiqhQg* c_p0);
N_LIB_PRIVATE N_NOINLINE(void, addZCT__system_u5914)(tyObject_CellSeq__bujfeOTzwHFbmRmN0zU6RQ* s_p0, tyObject_Cell__63almy5QgAJFi8PFYiqhQg* c_p1);
N_LIB_PRIVATE N_NIMCALL(NIM_BOOL, eqeq___OOZOOZOOZOOZOOZstorageZOnimbleZpkgs50Zdocopt4548O55O4945515655f49ae4955f51b55545048c55564952cf5252a5350d51d5749b56574854e57Zdocopt_u876)(tyObject_PatterncolonObjectType___kYKDtfqk0BT2oNg7UWsCIA* self_p0, tyObject_PatterncolonObjectType___kYKDtfqk0BT2oNg7UWsCIA* other_p1);
static N_INLINE(NIM_BOOL, contains__OOZOOZOOZOOZOOZstorageZOnimbleZpkgs50Zdocopt4548O55O4945515655f49ae4955f51b55545048c55564952cf5252a5350d51d5749b56574854e57Zdocopt_u959)(tyObject_PatterncolonObjectType___kYKDtfqk0BT2oNg7UWsCIA** a_p0, NI a_p0Len_0, tyObject_PatterncolonObjectType___kYKDtfqk0BT2oNg7UWsCIA* item_p1);
static N_INLINE(NI, find__OOZOOZOOZOOZOOZstorageZOnimbleZpkgs50Zdocopt4548O55O4945515655f49ae4955f51b55545048c55564952cf5252a5350d51d5749b56574854e57Zdocopt_u964)(tyObject_PatterncolonObjectType___kYKDtfqk0BT2oNg7UWsCIA** a_p0, NI a_p0Len_0, tyObject_PatterncolonObjectType___kYKDtfqk0BT2oNg7UWsCIA* item_p1);
N_LIB_PRIVATE N_NIMCALL(TGenericSeq*, setLengthSeqV2)(TGenericSeq* s_p0, TNimType* typ_p1, NI newLen_p2);
N_LIB_PRIVATE N_NIMCALL(void, unsureAsgnRef)(void** dest_p0, void* src_p1);
static N_INLINE(NIM_BOOL, contains__OOZOOZOOZOOZOOZstorageZOnimbleZpkgs50Zdocopt4548O55O4945515655f49ae4955f51b55545048c55564952cf5252a5350d51d5749b56574854e57Zdocopt_u3353)(tyObject_OptioncolonObjectType___6fMbuSGusnPF74lMDzIxiw** a_p0, NI a_p0Len_0, tyObject_OptioncolonObjectType___6fMbuSGusnPF74lMDzIxiw* item_p1);
static N_INLINE(NI, find__OOZOOZOOZOOZOOZstorageZOnimbleZpkgs50Zdocopt4548O55O4945515655f49ae4955f51b55545048c55564952cf5252a5350d51d5749b56574854e57Zdocopt_u3358)(tyObject_OptioncolonObjectType___6fMbuSGusnPF74lMDzIxiw** a_p0, NI a_p0Len_0, tyObject_OptioncolonObjectType___6fMbuSGusnPF74lMDzIxiw* item_p1);
extern TNimType NTIseqLpatternT__kasHz6xCB274qU5KlcPRmQ_;
extern TNimType NTIseqLoptionT__IcY9aBeQTf9aVLLxfaauqmxg_;
extern NIM_THREADVAR tyObject_GcHeap__hU8qDj9ctryZt6O9ctH4Uurw gch__system_u5853;
static N_INLINE(NI, pluspercent___system_u786)(NI x_p0, NI y_p1) {
	NI result;
	result = (NI)0;
	result = ((NI) ((NU)((NU64)(((NU) (x_p0))) + (NU64)(((NU) (y_p1))))));
	return result;
}
static N_INLINE(void, incRef__system_u5958)(tyObject_Cell__63almy5QgAJFi8PFYiqhQg* c_p0) {
	(*c_p0).refcount = pluspercent___system_u786((*c_p0).refcount, ((NI)8));
}
static N_INLINE(NI, minuspercent___system_u806)(NI x_p0, NI y_p1) {
	NI result;
	result = (NI)0;
	result = ((NI) ((NU)((NU64)(((NU) (x_p0))) - (NU64)(((NU) (y_p1))))));
	return result;
}
static N_INLINE(tyObject_Cell__63almy5QgAJFi8PFYiqhQg*, usrToCell__system_u5920)(void* usr_p0) {
	tyObject_Cell__63almy5QgAJFi8PFYiqhQg* result;
	NI T1_;
	result = (tyObject_Cell__63almy5QgAJFi8PFYiqhQg*)0;
	T1_ = (NI)0;
	T1_ = minuspercent___system_u806(((NI) (ptrdiff_t) (usr_p0)), ((NI)16));
	result = ((tyObject_Cell__63almy5QgAJFi8PFYiqhQg*) (T1_));
	return result;
}
static N_INLINE(NIM_BOOL, ltpercent___system_u1083)(NI x_p0, NI y_p1) {
	NIM_BOOL result;
	result = (NIM_BOOL)0;
	result = ((NU64)(((NU) (x_p0))) < (NU64)(((NU) (y_p1))));
	return result;
}
static N_INLINE(void, rtlAddZCT__system_u5963)(tyObject_Cell__63almy5QgAJFi8PFYiqhQg* c_p0) {
	addZCT__system_u5914((&gch__system_u5853.zct), c_p0);
}
static N_INLINE(void, decRef__system_u5965)(tyObject_Cell__63almy5QgAJFi8PFYiqhQg* c_p0) {
	(*c_p0).refcount = minuspercent___system_u806((*c_p0).refcount, ((NI)8));
	{
		NIM_BOOL T3_;
		T3_ = (NIM_BOOL)0;
		T3_ = ltpercent___system_u1083((*c_p0).refcount, ((NI)8));
		if (!T3_) goto LA4_;
		rtlAddZCT__system_u5963(c_p0);
	}
LA4_: ;
}
static N_INLINE(void, asgnRef)(void** dest_p0, void* src_p1) {
	{
		tyObject_Cell__63almy5QgAJFi8PFYiqhQg* T5_;
		if (!!((src_p1 == NIM_NIL))) goto LA3_;
		T5_ = (tyObject_Cell__63almy5QgAJFi8PFYiqhQg*)0;
		T5_ = usrToCell__system_u5920(src_p1);
		incRef__system_u5958(T5_);
	}
LA3_: ;
	{
		tyObject_Cell__63almy5QgAJFi8PFYiqhQg* T10_;
		if (!!(((*dest_p0) == NIM_NIL))) goto LA8_;
		T10_ = (tyObject_Cell__63almy5QgAJFi8PFYiqhQg*)0;
		T10_ = usrToCell__system_u5920((*dest_p0));
		decRef__system_u5965(T10_);
	}
LA8_: ;
	(*dest_p0) = src_p1;
}
static N_INLINE(NI, find__OOZOOZOOZOOZOOZstorageZOnimbleZpkgs50Zdocopt4548O55O4945515655f49ae4955f51b55545048c55564952cf5252a5350d51d5749b56574854e57Zdocopt_u964)(tyObject_PatterncolonObjectType___kYKDtfqk0BT2oNg7UWsCIA** a_p0, NI a_p0Len_0, tyObject_PatterncolonObjectType___kYKDtfqk0BT2oNg7UWsCIA* item_p1) {
	NI result;
{	result = (NI)0;
	result = ((NI)0);
	{
		tyObject_PatterncolonObjectType___kYKDtfqk0BT2oNg7UWsCIA** i;
		NI i_2;
		i = (tyObject_PatterncolonObjectType___kYKDtfqk0BT2oNg7UWsCIA**)0;
		i_2 = ((NI)0);
		{
			while (1) {
				if (!(i_2 < a_p0Len_0)) goto LA3;
				i = &a_p0[i_2];
				{
					NIM_BOOL T6_;
					T6_ = (NIM_BOOL)0;
					T6_ = eqeq___OOZOOZOOZOOZOOZstorageZOnimbleZpkgs50Zdocopt4548O55O4945515655f49ae4955f51b55545048c55564952cf5252a5350d51d5749b56574854e57Zdocopt_u876((*i), item_p1);
					if (!T6_) goto LA7_;
					goto BeforeRet_;
				}
LA7_: ;
				result += ((NI)1);
				i_2 += ((NI)1);
			} LA3: ;
		}
	}
	result = ((NI)-1);
	}BeforeRet_: ;
	return result;
}
static N_INLINE(NIM_BOOL, contains__OOZOOZOOZOOZOOZstorageZOnimbleZpkgs50Zdocopt4548O55O4945515655f49ae4955f51b55545048c55564952cf5252a5350d51d5749b56574854e57Zdocopt_u959)(tyObject_PatterncolonObjectType___kYKDtfqk0BT2oNg7UWsCIA** a_p0, NI a_p0Len_0, tyObject_PatterncolonObjectType___kYKDtfqk0BT2oNg7UWsCIA* item_p1) {
	NIM_BOOL result;
	NI T1_;
{	result = (NIM_BOOL)0;
	T1_ = (NI)0;
	T1_ = find__OOZOOZOOZOOZOOZstorageZOnimbleZpkgs50Zdocopt4548O55O4945515655f49ae4955f51b55545048c55564952cf5252a5350d51d5749b56574854e57Zdocopt_u964(a_p0, a_p0Len_0, item_p1);
	result = (((NI)0) <= T1_);
	goto BeforeRet_;
	}BeforeRet_: ;
	return result;
}
N_LIB_PRIVATE N_NIMCALL(tySequence__kasHz6xCB274qU5KlcPRmQ*, deduplicate__OOZOOZOOZOOZOOZstorageZOnimbleZpkgs50Zdocopt4548O55O4945515655f49ae4955f51b55545048c55564952cf5252a5350d51d5749b56574854e57Zdocopt_u1041)(tyObject_PatterncolonObjectType___kYKDtfqk0BT2oNg7UWsCIA** s_p0, NI s_p0Len_0, NIM_BOOL isSorted_p1) {
	tySequence__kasHz6xCB274qU5KlcPRmQ* result;
	result = NIM_NIL;
	result = NIM_NIL;
	{
		if (!(((NI)0) < s_p0Len_0)) goto LA3_;
		{
			tyObject_PatterncolonObjectType___kYKDtfqk0BT2oNg7UWsCIA* prev;
			NI T9_;
			if (!isSorted_p1) goto LA7_;
			prev = s_p0[((NI)0)];
			result = (tySequence__kasHz6xCB274qU5KlcPRmQ*) incrSeqV3((TGenericSeq*)(result), (&NTIseqLpatternT__kasHz6xCB274qU5KlcPRmQ_));
			T9_ = result->Sup.len++;
			asgnRef((void**) (&result->data[T9_]), prev);
			{
				NI i;
				NI colontmp_;
				NI res;
				i = (NI)0;
				colontmp_ = (NI)0;
				colontmp_ = (s_p0Len_0-1);
				res = ((NI)1);
				{
					while (1) {
						if (!(res <= colontmp_)) goto LA12;
						i = res;
						{
							NIM_BOOL T15_;
							NI T18_;
							T15_ = (NIM_BOOL)0;
							T15_ = eqeq___OOZOOZOOZOOZOOZstorageZOnimbleZpkgs50Zdocopt4548O55O4945515655f49ae4955f51b55545048c55564952cf5252a5350d51d5749b56574854e57Zdocopt_u876(s_p0[i], prev);
							if (!!(T15_)) goto LA16_;
							prev = s_p0[i];
							result = (tySequence__kasHz6xCB274qU5KlcPRmQ*) incrSeqV3((TGenericSeq*)(result), (&NTIseqLpatternT__kasHz6xCB274qU5KlcPRmQ_));
							T18_ = result->Sup.len++;
							asgnRef((void**) (&result->data[T18_]), prev);
						}
LA16_: ;
						res += ((NI)1);
					} LA12: ;
				}
			}
		}
		goto LA5_;
LA7_: ;
		{
			{
				tyObject_PatterncolonObjectType___kYKDtfqk0BT2oNg7UWsCIA** itm;
				NI i_2;
				itm = (tyObject_PatterncolonObjectType___kYKDtfqk0BT2oNg7UWsCIA**)0;
				i_2 = ((NI)0);
				{
					while (1) {
						if (!(i_2 < s_p0Len_0)) goto LA22;
						itm = &s_p0[i_2];
						{
							NIM_BOOL T25_;
							NI T28_;
							T25_ = (NIM_BOOL)0;
							T25_ = contains__OOZOOZOOZOOZOOZstorageZOnimbleZpkgs50Zdocopt4548O55O4945515655f49ae4955f51b55545048c55564952cf5252a5350d51d5749b56574854e57Zdocopt_u959((result) ? (result->data) : NIM_NIL, (result ? result->Sup.len : 0), (*itm));
							if (!!(T25_)) goto LA26_;
							result = (tySequence__kasHz6xCB274qU5KlcPRmQ*) incrSeqV3((TGenericSeq*)(result), (&NTIseqLpatternT__kasHz6xCB274qU5KlcPRmQ_));
							T28_ = result->Sup.len++;
							asgnRef((void**) (&result->data[T28_]), (*itm));
						}
LA26_: ;
						i_2 += ((NI)1);
					} LA22: ;
				}
			}
		}
LA5_: ;
	}
LA3_: ;
	return result;
}
N_LIB_PRIVATE N_NIMCALL(void, delete__OOZOOZOOZOOZOOZstorageZOnimbleZpkgs50Zdocopt4548O55O4945515655f49ae4955f51b55545048c55564952cf5252a5350d51d5749b56574854e57Zdocopt_u1212)(tySequence__kasHz6xCB274qU5KlcPRmQ** s_p0, tyObject_HSlice__M59bWryXDzi9cuLaUQXWQ7fg slice_p1) {
	{
		NI iX60gensym35_;
		NI jX60gensym35_;
		NI newLenX60gensym35_;
		NI T5_;
		if (!(slice_p1.a <= slice_p1.b)) goto LA3_;
		iX60gensym35_ = slice_p1.a;
		jX60gensym35_ = (NI)(slice_p1.b + ((NI)1));
		T5_ = ((*s_p0) ? (*s_p0)->Sup.len : 0);
		newLenX60gensym35_ = (NI)((NI)(T5_ - jX60gensym35_) + iX60gensym35_);
		{
			while (1) {
				if (!(iX60gensym35_ < newLenX60gensym35_)) goto LA7;
				asgnRef((void**) (&(*s_p0)->data[iX60gensym35_]), (*s_p0)->data[jX60gensym35_]);
				iX60gensym35_ += ((NI)1);
				jX60gensym35_ += ((NI)1);
			} LA7: ;
		}
		unsureAsgnRef((void**) (&(*s_p0)), (tySequence__kasHz6xCB274qU5KlcPRmQ*) setLengthSeqV2(((*s_p0))?&((*s_p0))->Sup:NIM_NIL, (&NTIseqLpatternT__kasHz6xCB274qU5KlcPRmQ_), ((NI) (newLenX60gensym35_))));
	}
LA3_: ;
}
static N_INLINE(NI, find__OOZOOZOOZOOZOOZstorageZOnimbleZpkgs50Zdocopt4548O55O4945515655f49ae4955f51b55545048c55564952cf5252a5350d51d5749b56574854e57Zdocopt_u3358)(tyObject_OptioncolonObjectType___6fMbuSGusnPF74lMDzIxiw** a_p0, NI a_p0Len_0, tyObject_OptioncolonObjectType___6fMbuSGusnPF74lMDzIxiw* item_p1) {
	NI result;
{	result = (NI)0;
	result = ((NI)0);
	{
		tyObject_OptioncolonObjectType___6fMbuSGusnPF74lMDzIxiw** i;
		NI i_2;
		i = (tyObject_OptioncolonObjectType___6fMbuSGusnPF74lMDzIxiw**)0;
		i_2 = ((NI)0);
		{
			while (1) {
				if (!(i_2 < a_p0Len_0)) goto LA3;
				i = &a_p0[i_2];
				{
					if (!((*i) == item_p1)) goto LA6_;
					goto BeforeRet_;
				}
LA6_: ;
				result += ((NI)1);
				i_2 += ((NI)1);
			} LA3: ;
		}
	}
	result = ((NI)-1);
	}BeforeRet_: ;
	return result;
}
static N_INLINE(NIM_BOOL, contains__OOZOOZOOZOOZOOZstorageZOnimbleZpkgs50Zdocopt4548O55O4945515655f49ae4955f51b55545048c55564952cf5252a5350d51d5749b56574854e57Zdocopt_u3353)(tyObject_OptioncolonObjectType___6fMbuSGusnPF74lMDzIxiw** a_p0, NI a_p0Len_0, tyObject_OptioncolonObjectType___6fMbuSGusnPF74lMDzIxiw* item_p1) {
	NIM_BOOL result;
	NI T1_;
{	result = (NIM_BOOL)0;
	T1_ = (NI)0;
	T1_ = find__OOZOOZOOZOOZOOZstorageZOnimbleZpkgs50Zdocopt4548O55O4945515655f49ae4955f51b55545048c55564952cf5252a5350d51d5749b56574854e57Zdocopt_u3358(a_p0, a_p0Len_0, item_p1);
	result = (((NI)0) <= T1_);
	goto BeforeRet_;
	}BeforeRet_: ;
	return result;
}
N_LIB_PRIVATE N_NIMCALL(tySequence__IcY9aBeQTf9aVLLxfaauqmxg*, deduplicate__OOZOOZOOZOOZOOZstorageZOnimbleZpkgs50Zdocopt4548O55O4945515655f49ae4955f51b55545048c55564952cf5252a5350d51d5749b56574854e57Zdocopt_u3306)(tyObject_OptioncolonObjectType___6fMbuSGusnPF74lMDzIxiw** s_p0, NI s_p0Len_0, NIM_BOOL isSorted_p1) {
	tySequence__IcY9aBeQTf9aVLLxfaauqmxg* result;
	result = NIM_NIL;
	result = NIM_NIL;
	{
		if (!(((NI)0) < s_p0Len_0)) goto LA3_;
		{
			tyObject_OptioncolonObjectType___6fMbuSGusnPF74lMDzIxiw* prev;
			NI T9_;
			if (!isSorted_p1) goto LA7_;
			prev = s_p0[((NI)0)];
			result = (tySequence__IcY9aBeQTf9aVLLxfaauqmxg*) incrSeqV3((TGenericSeq*)(result), (&NTIseqLoptionT__IcY9aBeQTf9aVLLxfaauqmxg_));
			T9_ = result->Sup.len++;
			asgnRef((void**) (&result->data[T9_]), prev);
			{
				NI i;
				NI colontmp_;
				NI res;
				i = (NI)0;
				colontmp_ = (NI)0;
				colontmp_ = (s_p0Len_0-1);
				res = ((NI)1);
				{
					while (1) {
						if (!(res <= colontmp_)) goto LA12;
						i = res;
						{
							NI T17_;
							if (!!((s_p0[i] == prev))) goto LA15_;
							prev = s_p0[i];
							result = (tySequence__IcY9aBeQTf9aVLLxfaauqmxg*) incrSeqV3((TGenericSeq*)(result), (&NTIseqLoptionT__IcY9aBeQTf9aVLLxfaauqmxg_));
							T17_ = result->Sup.len++;
							asgnRef((void**) (&result->data[T17_]), prev);
						}
LA15_: ;
						res += ((NI)1);
					} LA12: ;
				}
			}
		}
		goto LA5_;
LA7_: ;
		{
			{
				tyObject_OptioncolonObjectType___6fMbuSGusnPF74lMDzIxiw** itm;
				NI i_2;
				itm = (tyObject_OptioncolonObjectType___6fMbuSGusnPF74lMDzIxiw**)0;
				i_2 = ((NI)0);
				{
					while (1) {
						if (!(i_2 < s_p0Len_0)) goto LA21;
						itm = &s_p0[i_2];
						{
							NIM_BOOL T24_;
							NI T27_;
							T24_ = (NIM_BOOL)0;
							T24_ = contains__OOZOOZOOZOOZOOZstorageZOnimbleZpkgs50Zdocopt4548O55O4945515655f49ae4955f51b55545048c55564952cf5252a5350d51d5749b56574854e57Zdocopt_u3353((result) ? (result->data) : NIM_NIL, (result ? result->Sup.len : 0), (*itm));
							if (!!(T24_)) goto LA25_;
							result = (tySequence__IcY9aBeQTf9aVLLxfaauqmxg*) incrSeqV3((TGenericSeq*)(result), (&NTIseqLoptionT__IcY9aBeQTf9aVLLxfaauqmxg_));
							T27_ = result->Sup.len++;
							asgnRef((void**) (&result->data[T27_]), (*itm));
						}
LA25_: ;
						i_2 += ((NI)1);
					} LA21: ;
				}
			}
		}
LA5_: ;
	}
LA3_: ;
	return result;
}
