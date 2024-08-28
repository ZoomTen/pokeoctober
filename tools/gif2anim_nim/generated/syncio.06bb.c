/* Generated by Nim Compiler v2.0.4 */
#define NIM_INTBITS 64
#define NIM_EmulateOverflowChecks

#include "nimbase.h"
#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <fcntl.h>
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
typedef struct NimStrPayload NimStrPayload;
typedef struct NimStringV2 NimStringV2;
typedef struct tyObject_IOError__Qi3evlt89aqWKwrBQyvZbmQ tyObject_IOError__Qi3evlt89aqWKwrBQyvZbmQ;
typedef struct tyObject_CatchableError__6ZSwHJ2XlTWRVjglvm4hzA tyObject_CatchableError__6ZSwHJ2XlTWRVjglvm4hzA;
typedef struct Exception Exception;
typedef struct RootObj RootObj;
typedef struct TNimTypeV2 TNimTypeV2;
typedef struct tySequence__XG4R01knG9cEwdYd9bcmBqNA tySequence__XG4R01knG9cEwdYd9bcmBqNA;
typedef struct tySequence__XG4R01knG9cEwdYd9bcmBqNA_Content tySequence__XG4R01knG9cEwdYd9bcmBqNA_Content;
typedef struct tyObject_StackTraceEntry__WkvFOV75fZrMSq9cfulfsdA tyObject_StackTraceEntry__WkvFOV75fZrMSq9cfulfsdA;
struct NimStrPayload {
	NI cap;
	NIM_CHAR data[SEQ_DECL_SIZE];
};
struct NimStringV2 {
	NI len;
	NimStrPayload* p;
};
struct TNimTypeV2 {
	void* destructor;
	NI size;
	NI16 align;
	NI16 depth;
	NU32* display;
	void* traceImpl;
	void* typeInfoV1;
	NI flags;
};
struct RootObj {
TNimTypeV2* m_type;
};
struct tySequence__XG4R01knG9cEwdYd9bcmBqNA {
  NI len; tySequence__XG4R01knG9cEwdYd9bcmBqNA_Content* p;
};
struct Exception {
  RootObj Sup;
	Exception* parent;
	NCSTRING name;
	NimStringV2 message;
	tySequence__XG4R01knG9cEwdYd9bcmBqNA trace;
	Exception* up;
};
struct tyObject_CatchableError__6ZSwHJ2XlTWRVjglvm4hzA {
  Exception Sup;
};
struct tyObject_IOError__Qi3evlt89aqWKwrBQyvZbmQ {
  tyObject_CatchableError__6ZSwHJ2XlTWRVjglvm4hzA Sup;
};
typedef NU8 tyEnum_FileMode__kCMmS8eA26MuSzmlLMiiIg;
typedef NCSTRING tyArray__t8FrlBVt7uLU9anQ9a9cQrmJg[5];
struct tyObject_StackTraceEntry__WkvFOV75fZrMSq9cfulfsdA {
	NCSTRING procname;
	NI line;
	NCSTRING filename;
};
struct tySequence__XG4R01knG9cEwdYd9bcmBqNA_Content { NI cap; tyObject_StackTraceEntry__WkvFOV75fZrMSq9cfulfsdA data[SEQ_DECL_SIZE]; };
N_LIB_PRIVATE N_NIMCALL(NI, writeBuffer__stdZsyncio_u181)(FILE* f_p0, void* buffer_p1, NI len_p2);
N_LIB_PRIVATE N_NIMCALL(void, checkErr__stdZsyncio_u147)(FILE* f_p0);
static N_INLINE(void, appendString)(NimStringV2* dest_p0, NimStringV2 src_p1);
static N_INLINE(void, copyMem__system_u1740)(void* dest_p0, void* source_p1, NI size_p2);
static N_INLINE(void, nimCopyMem)(void* dest_p0, void* source_p1, NI size_p2);
N_LIB_PRIVATE N_NIMCALL(NimStringV2, dollar___systemZdollars_u3)(NI x_p0);
N_LIB_PRIVATE N_NIMCALL(NimStringV2, cstrToNimstr)(NCSTRING str_p0);
N_LIB_PRIVATE N_NIMCALL(NimStringV2, rawNewString)(NI space_p0);
N_LIB_PRIVATE N_NOINLINE(void, raiseEIO__stdZsyncio_u94)(NimStringV2 msg_p0);
N_LIB_PRIVATE N_NIMCALL(void*, nimNewObj)(NI size_p0, NI alignment_p1);
N_LIB_PRIVATE N_NIMCALL(void, eqwasMoved___stdZassertions_u13)(NimStringV2* dest_p0);
N_LIB_PRIVATE N_NIMCALL(void, raiseExceptionEx)(Exception* e_p0, NCSTRING ename_p1, NCSTRING procname_p2, NCSTRING filename_p3, NI line_p4);
N_LIB_PRIVATE N_NOCONV(void, dealloc)(void* p_p0);
static N_INLINE(NIM_BOOL*, nimErrorFlag)(void);
static N_INLINE(NCSTRING, nimToCStringConv)(NimStringV2 s_p0);
N_LIB_PRIVATE N_NIMCALL(NIM_BOOL, open__stdZsyncio_u394)(FILE** f_p0, NimStringV2 filename_p1, tyEnum_FileMode__kCMmS8eA26MuSzmlLMiiIg mode_p2, NI bufSize_p3);
N_LIB_PRIVATE N_NIMCALL(int, getFileHandle__stdZsyncio_u256)(FILE* f_p0);
N_LIB_PRIVATE N_NIMCALL(void, close__stdZsyncio_u245)(FILE* f_p0);
static const struct {
  NI cap; NIM_CHAR data[7+1];
} TM__xNF6mvRQ4Pd1hTNM9cEHXwQ_2 = { 7 | NIM_STRLIT_FLAG, "errno: " };
static const NimStringV2 TM__xNF6mvRQ4Pd1hTNM9cEHXwQ_3 = {7, (NimStrPayload*)&TM__xNF6mvRQ4Pd1hTNM9cEHXwQ_2};
static const struct {
  NI cap; NIM_CHAR data[2+1];
} TM__xNF6mvRQ4Pd1hTNM9cEHXwQ_4 = { 2 | NIM_STRLIT_FLAG, " `" };
static const NimStringV2 TM__xNF6mvRQ4Pd1hTNM9cEHXwQ_5 = {2, (NimStrPayload*)&TM__xNF6mvRQ4Pd1hTNM9cEHXwQ_4};
static const struct {
  NI cap; NIM_CHAR data[1+1];
} TM__xNF6mvRQ4Pd1hTNM9cEHXwQ_6 = { 1 | NIM_STRLIT_FLAG, "`" };
static const NimStringV2 TM__xNF6mvRQ4Pd1hTNM9cEHXwQ_7 = {1, (NimStrPayload*)&TM__xNF6mvRQ4Pd1hTNM9cEHXwQ_6};
extern TNimTypeV2 NTIv2__Qi3evlt89aqWKwrBQyvZbmQ_;
static const struct {
  NI cap; NIM_CHAR data[27+1];
} TM__xNF6mvRQ4Pd1hTNM9cEHXwQ_8 = { 27 | NIM_STRLIT_FLAG, "cannot write string to file" };
static const NimStringV2 TM__xNF6mvRQ4Pd1hTNM9cEHXwQ_9 = {27, (NimStrPayload*)&TM__xNF6mvRQ4Pd1hTNM9cEHXwQ_8};
static const struct {
  NI cap; NIM_CHAR data[13+1];
} TM__xNF6mvRQ4Pd1hTNM9cEHXwQ_10 = { 13 | NIM_STRLIT_FLAG, "cannot open: " };
static const NimStringV2 TM__xNF6mvRQ4Pd1hTNM9cEHXwQ_11 = {13, (NimStrPayload*)&TM__xNF6mvRQ4Pd1hTNM9cEHXwQ_10};
N_LIB_PRIVATE NIM_CONST tyArray__t8FrlBVt7uLU9anQ9a9cQrmJg FormatOpen__stdZsyncio_u385 = {"rbe",
"wbe",
"w+be",
"r+be",
"abe"}
;
extern NIM_BOOL nimInErrorMode__system_u3439;
static N_INLINE(void, nimCopyMem)(void* dest_p0, void* source_p1, NI size_p2) {
	void* T1_;
	T1_ = (void*)0;
	T1_ = memcpy(dest_p0, source_p1, ((size_t) (size_p2)));
}
static N_INLINE(void, copyMem__system_u1740)(void* dest_p0, void* source_p1, NI size_p2) {
	nimCopyMem(dest_p0, source_p1, size_p2);
}
static N_INLINE(void, appendString)(NimStringV2* dest_p0, NimStringV2 src_p1) {
	{
		if (!(((NI)0) < src_p1.len)) goto LA3_;
		copyMem__system_u1740(((void*) ((&(*(*dest_p0).p).data[(*dest_p0).len]))), ((void*) ((&(*src_p1.p).data[((NI)0)]))), ((NI) ((NI)(src_p1.len + ((NI)1)))));
		(*dest_p0).len += src_p1.len;
	}
LA3_: ;
}
static N_INLINE(NIM_BOOL*, nimErrorFlag)(void) {
	NIM_BOOL* result;
	result = (&nimInErrorMode__system_u3439);
	return result;
}
N_LIB_PRIVATE N_NOINLINE(void, raiseEIO__stdZsyncio_u94)(NimStringV2 msg_p0) {
	tyObject_IOError__Qi3evlt89aqWKwrBQyvZbmQ* T2_;
	NimStringV2 blitTmp;
NIM_BOOL* nimErr_;
{nimErr_ = nimErrorFlag();
	T2_ = NIM_NIL;
	T2_ = (tyObject_IOError__Qi3evlt89aqWKwrBQyvZbmQ*) nimNewObj(sizeof(tyObject_IOError__Qi3evlt89aqWKwrBQyvZbmQ), NIM_ALIGNOF(tyObject_IOError__Qi3evlt89aqWKwrBQyvZbmQ));
	(*T2_).Sup.Sup.Sup.m_type = (&NTIv2__Qi3evlt89aqWKwrBQyvZbmQ_);
	(*T2_).Sup.Sup.name = "IOError";
	blitTmp = msg_p0;
	eqwasMoved___stdZassertions_u13((&msg_p0));
	(*T2_).Sup.Sup.message = blitTmp;
	(*T2_).Sup.Sup.parent = ((Exception*) NIM_NIL);
	raiseExceptionEx((Exception*)T2_, "IOError", "raiseEIO", "syncio.nim", 158);
goto LA1_;
	{
		LA1_:;
	}
	{
		if (msg_p0.p && !(msg_p0.p->cap & NIM_STRLIT_FLAG)) {
 dealloc(msg_p0.p);
}
	}
	if (NIM_UNLIKELY(*nimErr_)) goto BeforeRet_;
	}BeforeRet_: ;
}
N_LIB_PRIVATE N_NIMCALL(void, checkErr__stdZsyncio_u147)(FILE* f_p0) {
NIM_BOOL* nimErr_;
{nimErr_ = nimErrorFlag();
	{
		int T3_;
		NimStringV2 msg;
		NimStringV2 colontmpD_;
		NimStringV2 colontmpD__2;
		NimStringV2 T7_;
		NCSTRING T8_;
		NimStringV2 blitTmp;
		T3_ = (int)0;
		T3_ = ferror(f_p0);
		if (!!((T3_ == ((NI32)0)))) goto LA4_;
		msg.len = 0; msg.p = NIM_NIL;
		colontmpD_.len = 0; colontmpD_.p = NIM_NIL;
		colontmpD__2.len = 0; colontmpD__2.p = NIM_NIL;
		T7_.len = 0; T7_.p = NIM_NIL;
		colontmpD_ = dollar___systemZdollars_u3(((NI) (errno)));
		T8_ = (NCSTRING)0;
		T8_ = strerror(errno);
		colontmpD__2 = cstrToNimstr(T8_);
		T7_ = rawNewString(colontmpD_.len + colontmpD__2.len + 10);
appendString((&T7_), TM__xNF6mvRQ4Pd1hTNM9cEHXwQ_3);
appendString((&T7_), colontmpD_);
appendString((&T7_), TM__xNF6mvRQ4Pd1hTNM9cEHXwQ_5);
appendString((&T7_), colontmpD__2);
appendString((&T7_), TM__xNF6mvRQ4Pd1hTNM9cEHXwQ_7);
		msg = T7_;
		clearerr(f_p0);
		blitTmp = msg;
		eqwasMoved___stdZassertions_u13((&msg));
		raiseEIO__stdZsyncio_u94(blitTmp);
		if (NIM_UNLIKELY(*nimErr_)) goto LA6_;
		{
			LA6_:;
		}
		{
			if (colontmpD__2.p && !(colontmpD__2.p->cap & NIM_STRLIT_FLAG)) {
 dealloc(colontmpD__2.p);
}
			if (colontmpD_.p && !(colontmpD_.p->cap & NIM_STRLIT_FLAG)) {
 dealloc(colontmpD_.p);
}
			if (msg.p && !(msg.p->cap & NIM_STRLIT_FLAG)) {
 dealloc(msg.p);
}
		}
		if (NIM_UNLIKELY(*nimErr_)) goto BeforeRet_;
	}
LA4_: ;
	}BeforeRet_: ;
}
N_LIB_PRIVATE N_NIMCALL(NI, writeBuffer__stdZsyncio_u181)(FILE* f_p0, void* buffer_p1, NI len_p2) {
	NI result;
	size_t T1_;
NIM_BOOL* nimErr_;
{nimErr_ = nimErrorFlag();
	T1_ = (size_t)0;
	T1_ = fwrite(buffer_p1, ((size_t)1), ((size_t) (len_p2)), f_p0);
	result = ((NI) (T1_));
	checkErr__stdZsyncio_u147(f_p0);
	if (NIM_UNLIKELY(*nimErr_)) goto BeforeRet_;
	}BeforeRet_: ;
	return result;
}
static N_INLINE(NCSTRING, nimToCStringConv)(NimStringV2 s_p0) {
	NCSTRING result;
	{
		if (!(s_p0.len == ((NI)0))) goto LA3_;
		result = "";
	}
	goto LA1_;
LA3_: ;
	{
		result = ((NCSTRING) ((*s_p0.p).data));
	}
LA1_: ;
	return result;
}
N_LIB_PRIVATE N_NIMCALL(void, write__stdZsyncio_u233)(FILE* f_p0, NimStringV2 s_p1) {
NIM_BOOL* nimErr_;
{nimErr_ = nimErrorFlag();
	{
		NI T3_;
		T3_ = (NI)0;
		T3_ = writeBuffer__stdZsyncio_u181(f_p0, ((void*) (nimToCStringConv(s_p1))), ((NI) (s_p1.len)));
		if (NIM_UNLIKELY(*nimErr_)) goto BeforeRet_;
		if (!!((T3_ == s_p1.len))) goto LA4_;
		raiseEIO__stdZsyncio_u94(TM__xNF6mvRQ4Pd1hTNM9cEHXwQ_9);
		if (NIM_UNLIKELY(*nimErr_)) goto BeforeRet_;
	}
LA4_: ;
	}BeforeRet_: ;
}
N_LIB_PRIVATE N_NIMCALL(int, getFileHandle__stdZsyncio_u256)(FILE* f_p0) {
	int result;
	result = fileno(f_p0);
	return result;
}
N_LIB_PRIVATE N_NIMCALL(void, close__stdZsyncio_u245)(FILE* f_p0) {
	{
		int T5_;
		if (!!((f_p0 == 0))) goto LA3_;
		T5_ = (int)0;
		T5_ = fclose(f_p0);
		(void)(T5_);
	}
LA3_: ;
}
N_LIB_PRIVATE N_NIMCALL(NIM_BOOL, open__stdZsyncio_u394)(FILE** f_p0, NimStringV2 filename_p1, tyEnum_FileMode__kCMmS8eA26MuSzmlLMiiIg mode_p2, NI bufSize_p3) {
	NIM_BOOL result;
	void* p;
{	result = (NIM_BOOL)0;
	p = fopen(nimToCStringConv(filename_p1), FormatOpen__stdZsyncio_u385[(mode_p2)- 0]);
	{
		FILE* f2;
		struct stat res;
		if (!!((p == NIM_NIL))) goto LA3_;
		f2 = ((FILE*) (p));
		{
			NIM_BOOL T7_;
			int T8_;
			int T9_;
			T7_ = (NIM_BOOL)0;
			T8_ = (int)0;
			T8_ = getFileHandle__stdZsyncio_u256(f2);
			T9_ = (int)0;
			T9_ = fstat(T8_, (&res));
			T7_ = (((NI32)0) <= T9_);
			if (!(T7_)) goto LA10_;
			T7_ = S_ISDIR(res.st_mode);
LA10_: ;
			if (!T7_) goto LA11_;
			close__stdZsyncio_u245(f2);
			result = NIM_FALSE;
			goto BeforeRet_;
		}
LA11_: ;
		result = NIM_TRUE;
		(*f_p0) = ((FILE*) (p));
		{
			NIM_BOOL T15_;
			int T19_;
			T15_ = (NIM_BOOL)0;
			T15_ = (((NI)0) < bufSize_p3);
			if (!(T15_)) goto LA16_;
			T15_ = ((NU64)(((NU) (bufSize_p3))) <= (NU64)(((NU)-1)));
LA16_: ;
			if (!T15_) goto LA17_;
			T19_ = (int)0;
			T19_ = setvbuf((*f_p0), NIM_NIL, _IOFBF, ((size_t) (bufSize_p3)));
			(void)(T19_);
		}
		goto LA13_;
LA17_: ;
		{
			int T23_;
			if (!(bufSize_p3 == ((NI)0))) goto LA21_;
			T23_ = (int)0;
			T23_ = setvbuf((*f_p0), NIM_NIL, _IONBF, ((size_t)0));
			(void)(T23_);
		}
		goto LA13_;
LA21_: ;
LA13_: ;
	}
LA3_: ;
	}BeforeRet_: ;
	return result;
}
N_LIB_PRIVATE N_NIMCALL(FILE*, open__stdZsyncio_u458)(NimStringV2 filename_p0, tyEnum_FileMode__kCMmS8eA26MuSzmlLMiiIg mode_p1, NI bufSize_p2) {
	FILE* result;
{	result = (FILE*)0;
	{
		NIM_BOOL T3_;
		tyObject_IOError__Qi3evlt89aqWKwrBQyvZbmQ* T6_;
		NimStringV2 T7_;
		T3_ = (NIM_BOOL)0;
		T3_ = open__stdZsyncio_u394(&result, filename_p0, mode_p1, bufSize_p2);
		if (!!(T3_)) goto LA4_;
		T6_ = NIM_NIL;
		T6_ = (tyObject_IOError__Qi3evlt89aqWKwrBQyvZbmQ*) nimNewObj(sizeof(tyObject_IOError__Qi3evlt89aqWKwrBQyvZbmQ), NIM_ALIGNOF(tyObject_IOError__Qi3evlt89aqWKwrBQyvZbmQ));
		(*T6_).Sup.Sup.Sup.m_type = (&NTIv2__Qi3evlt89aqWKwrBQyvZbmQ_);
		(*T6_).Sup.Sup.name = "IOError";
		T7_.len = 0; T7_.p = NIM_NIL;
		T7_ = rawNewString(filename_p0.len + 13);
appendString((&T7_), TM__xNF6mvRQ4Pd1hTNM9cEHXwQ_11);
appendString((&T7_), filename_p0);
		(*T6_).Sup.Sup.message = T7_;
		(*T6_).Sup.Sup.parent = ((Exception*) NIM_NIL);
		raiseExceptionEx((Exception*)T6_, "IOError", "open", "syncio.nim", 767);
goto BeforeRet_;
	}
LA4_: ;
	}BeforeRet_: ;
	return result;
}