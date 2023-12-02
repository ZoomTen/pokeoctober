/* Generated by Nim Compiler v2.0.0 */
#define NIM_INTBITS 64

#include "nimbase.h"
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
typedef struct NimStringDesc NimStringDesc;
typedef struct TGenericSeq TGenericSeq;
struct TGenericSeq {
	NI len;
	NI reserved;
};
struct NimStringDesc {
  TGenericSeq Sup;
	NIM_CHAR data[SEQ_DECL_SIZE];
};
N_LIB_PRIVATE N_NIMCALL(NI, murmurHash__pureZhashes_u194)(NU8* x_p0, NI x_p0Len_0);
static N_INLINE(NU32, rotl32__pureZhashes_u182)(NU32 x_p0, NI r_p1);
static N_INLINE(NI, emarkamp___pureZhashes_u3)(NI h_p0, NI val_p1);
static N_INLINE(NI, hash__gif50anim_u235)(NU64 x_p0);
static N_INLINE(NI, hashWangYi1__pureZhashes_u138)(NU64 x_p0);
static N_INLINE(NU64, hiXorLo__pureZhashes_u79)(NU64 a_p0, NU64 b_p1);
static N_INLINE(NI, emarkdollar___pureZhashes_u18)(NI h_p0);
static N_INLINE(NU32, rotl32__pureZhashes_u182)(NU32 x_p0, NI r_p1) {
	NU32 result;
	result = (NU32)0;
	result = (NU32)((NU32)((NU64)(x_p0) << (NU64)(r_p1)) | (NU32)((NU32)(x_p0) >> (NU64)((NI)(((NI)32) - r_p1))));
	return result;
}
N_LIB_PRIVATE N_NIMCALL(NI, murmurHash__pureZhashes_u194)(NU8* x_p0, NI x_p0Len_0) {
	NI result;
	NI size;
	NI stepSize;
	NI n;
	NU32 h1;
	NI i;
	NU32 k1_2;
	NI rem;
{	result = (NI)0;
	size = x_p0Len_0;
	stepSize = ((NI)4);
	n = (NI)(size / stepSize);
	h1 = (NU32)0;
	i = ((NI)0);
	{
		while (1) {
			NU32 k1;
			if (!(i < (NI)(n * stepSize))) goto LA2;
			k1 = (NU32)0;
			k1 = (*((NU32*) ((&x_p0[i]))));
			i += stepSize;
			k1 = (NU32)((NU32)(k1) * (NU32)(((NU32)IL64(3432918353))));
			k1 = rotl32__pureZhashes_u182(k1, ((NI)15));
			k1 = (NU32)((NU32)(k1) * (NU32)(((NU32)461845907)));
			h1 = (NU32)(h1 ^ k1);
			h1 = rotl32__pureZhashes_u182(h1, ((NI)13));
			h1 = (NU32)((NU32)((NU32)((NU32)(h1) * (NU32)(((NU32)5)))) + (NU32)(((NU32)IL64(3864292196))));
		} LA2: ;
	}
	k1_2 = (NU32)0;
	rem = (NI)(size % stepSize);
	{
		while (1) {
			if (!(((NI)0) < rem)) goto LA4;
			rem -= ((NI)1);
			k1_2 = (NU32)((NU32)((NU64)(k1_2) << (NU64)(((NI)8))) | ((NU32) (x_p0[(NI)(i + rem)])));
		} LA4: ;
	}
	k1_2 = (NU32)((NU32)(k1_2) * (NU32)(((NU32)IL64(3432918353))));
	k1_2 = rotl32__pureZhashes_u182(k1_2, ((NI)15));
	k1_2 = (NU32)((NU32)(k1_2) * (NU32)(((NU32)461845907)));
	h1 = (NU32)(h1 ^ k1_2);
	h1 = (NU32)(h1 ^ ((NU32) (size)));
	h1 = (NU32)(h1 ^ (NU32)((NU32)(h1) >> (NU64)(((NI)16))));
	h1 = (NU32)((NU32)(h1) * (NU32)(((NU32)IL64(2246822507))));
	h1 = (NU32)(h1 ^ (NU32)((NU32)(h1) >> (NU64)(((NI)13))));
	h1 = (NU32)((NU32)(h1) * (NU32)(((NU32)IL64(3266489909))));
	h1 = (NU32)(h1 ^ (NU32)((NU32)(h1) >> (NU64)(((NI)16))));
	result = ((NI) (h1));
	goto BeforeRet_;
	}BeforeRet_: ;
	return result;
}
N_LIB_PRIVATE N_NIMCALL(NI, hash__pureZhashes_u283)(NimStringDesc* x_p0) {
	NI result;
	result = (NI)0;
	result = murmurHash__pureZhashes_u194(((x_p0) ? ((NU8*)x_p0->data+(((NI)0))) : NIM_NIL), (((x_p0 ? x_p0->Sup.len : 0)-1))-(((NI)0))+1);
	return result;
}
static N_INLINE(NI, emarkamp___pureZhashes_u3)(NI h_p0, NI val_p1) {
	NI result;
	NU h_2;
	NU val_2;
	NU res;
	result = (NI)0;
	h_2 = ((NU) (h_p0));
	val_2 = ((NU) (val_p1));
	res = (NU)((NU64)(h_2) + (NU64)(val_2));
	res = (NU)((NU64)(res) + (NU64)((NU)((NU64)(res) << (NU64)(((NI)10)))));
	res = (NU)(res ^ (NU)((NU64)(res) >> (NU64)(((NI)6))));
	result = ((NI) (res));
	return result;
}
static N_INLINE(NU64, hiXorLo__pureZhashes_u79)(NU64 a_p0, NU64 b_p1) {
	NU64 result;
	result = (NU64)0;
	__uint128_t r = a_p0; r *= b_p1; result = (r >> 64) ^ r;
	return result;
}
static N_INLINE(NI, hashWangYi1__pureZhashes_u138)(NU64 x_p0) {
	NI result;
	NU64 T1_;
	NU64 T2_;
	result = (NI)0;
	T1_ = (NU64)0;
	T1_ = hiXorLo__pureZhashes_u79(11562461410679940143ULL, (NU64)(x_p0 ^ 16646288086500911323ULL));
	T2_ = (NU64)0;
	T2_ = hiXorLo__pureZhashes_u79(T1_, 16952864883938283885ULL);
	result = ((NI) (T2_));
	return result;
}
static N_INLINE(NI, hash__gif50anim_u235)(NU64 x_p0) {
	NI result;
	result = (NI)0;
	result = hashWangYi1__pureZhashes_u138(((NU64) (x_p0)));
	return result;
}
static N_INLINE(NI, emarkdollar___pureZhashes_u18)(NI h_p0) {
	NI result;
	NU h_2;
	NU res;
	result = (NI)0;
	h_2 = ((NU) (h_p0));
	res = (NU)((NU64)(h_2) + (NU64)((NU)((NU64)(h_2) << (NU64)(((NI)3)))));
	res = (NU)(res ^ (NU)((NU64)(res) >> (NU64)(((NI)11))));
	res = (NU)((NU64)(res) + (NU64)((NU)((NU64)(res) << (NU64)(((NI)15)))));
	result = ((NI) (res));
	return result;
}
N_LIB_PRIVATE N_NIMCALL(NI, hash__gif50anim_u217)(NU64* x_p0, NI x_p0Len_0) {
	NI result;
	result = (NI)0;
	result = ((NI)0);
	{
		NU64* a;
		NI i;
		a = (NU64*)0;
		i = ((NI)0);
		{
			while (1) {
				NI T4_;
				if (!(i < x_p0Len_0)) goto LA3;
				a = (&x_p0[i]);
				T4_ = (NI)0;
				T4_ = hash__gif50anim_u235((*a));
				result = emarkamp___pureZhashes_u3(result, T4_);
				i += ((NI)1);
			} LA3: ;
		}
	}
	result = emarkdollar___pureZhashes_u18(result);
	return result;
}
