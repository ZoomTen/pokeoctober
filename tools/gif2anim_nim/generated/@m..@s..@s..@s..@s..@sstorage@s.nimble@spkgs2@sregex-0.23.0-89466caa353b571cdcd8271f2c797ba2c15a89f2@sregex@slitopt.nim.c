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
typedef struct tyObject_LitOpt__rBp0MZMRZP7rBikF9bpiiNg tyObject_LitOpt__rBp0MZMRZP7rBikF9bpiiNg;
typedef struct NimStringDesc NimStringDesc;
typedef struct TGenericSeq TGenericSeq;
typedef struct tyObject_Nfa__r9bDe9boJi9bXy3P2pJdys3yA tyObject_Nfa__r9bDe9boJi9bXy3P2pJdys3yA;
typedef struct tySequence__F1ji846yIiKV9cZCihYOWUQ tySequence__F1ji846yIiKV9cZCihYOWUQ;
typedef struct tyObject_Node__sp9aV9b8OMlkmM20y0mcfZfA tyObject_Node__sp9aV9b8OMlkmM20y0mcfZfA;
typedef struct tySequence__9aKpvUh0ca6Bp9cKAwrowqUg tySequence__9aKpvUh0ca6Bp9cKAwrowqUg;
typedef struct tySequence__lSdKeSXbofjQu7xoyTw4tw tySequence__lSdKeSXbofjQu7xoyTw4tw;
typedef struct tyObject_HashSet__8i9ce9b4ICGOKfHJgyCtWqsg tyObject_HashSet__8i9ce9b4ICGOKfHJgyCtWqsg;
typedef struct tySequence__U5QYqmtUND3fb25zvpemlg tySequence__U5QYqmtUND3fb25zvpemlg;
typedef struct tySequence__oq9bTfdMDX9b8UeCqnryMnGg tySequence__oq9bTfdMDX9b8UeCqnryMnGg;
typedef struct tyObject_SubExp__swf7y9cGD6sVn3AeagziFLw tyObject_SubExp__swf7y9cGD6sVn3AeagziFLw;
typedef struct tyObject_RpnExp__y8Y9bexvpsOflekBrjtnCVA tyObject_RpnExp__y8Y9bexvpsOflekBrjtnCVA;
typedef struct tyTuple__Ll5iolPASSzOEheeSNjmiw tyTuple__Ll5iolPASSzOEheeSNjmiw;
typedef struct tyObject_HSlice__QARZZod9cmcZIctCtTXieEw tyObject_HSlice__QARZZod9cmcZIctCtTXieEw;
struct TGenericSeq {
	NI len;
	NI reserved;
};
struct NimStringDesc {
  TGenericSeq Sup;
	NIM_CHAR data[SEQ_DECL_SIZE];
};
struct tyObject_Nfa__r9bDe9boJi9bXy3P2pJdys3yA {
	tySequence__F1ji846yIiKV9cZCihYOWUQ* s;
};
struct tyObject_LitOpt__rBp0MZMRZP7rBikF9bpiiNg {
	NI32 lit;
	NimStringDesc* lits;
	tyObject_Nfa__r9bDe9boJi9bXy3P2pJdys3yA nfa;
};
typedef NU8 tyEnum_NodeKind__HqWCfU2cQESx0DlWFH9c58A;
struct tyObject_HashSet__8i9ce9b4ICGOKfHJgyCtWqsg {
	tySequence__U5QYqmtUND3fb25zvpemlg* data;
	NI counter;
};
struct tyObject_RpnExp__y8Y9bexvpsOflekBrjtnCVA {
	tySequence__F1ji846yIiKV9cZCihYOWUQ* s;
};
struct tyObject_SubExp__swf7y9cGD6sVn3AeagziFLw {
	tyObject_Nfa__r9bDe9boJi9bXy3P2pJdys3yA nfa;
	tyObject_RpnExp__y8Y9bexvpsOflekBrjtnCVA rpn;
	NIM_BOOL reverseCapts;
};
struct tyObject_Node__sp9aV9b8OMlkmM20y0mcfZfA {
	tyEnum_NodeKind__HqWCfU2cQESx0DlWFH9c58A kind;
	NI32 cp;
	tySequence__9aKpvUh0ca6Bp9cKAwrowqUg* next;
	NIM_BOOL isGreedy;
	NI16 uid;
	NI16 idx;
	NIM_BOOL isCapturing;
	NimStringDesc* name;
	tySequence__lSdKeSXbofjQu7xoyTw4tw* flags;
	NI16 min;
	NI16 max;
	tyObject_HashSet__8i9ce9b4ICGOKfHJgyCtWqsg cps;
	tySequence__oq9bTfdMDX9b8UeCqnryMnGg* ranges;
	tySequence__F1ji846yIiKV9cZCihYOWUQ* shorthands;
	NI32 cc;
	tyObject_SubExp__swf7y9cGD6sVn3AeagziFLw subExp;
};
typedef NU8 tyEnum_Flag__h2WPr03XhVS16ye9c9c1nXtw;
struct tyTuple__Ll5iolPASSzOEheeSNjmiw {
NI Field0;
NI32 Field1;
};
struct tyObject_HSlice__QARZZod9cmcZIctCtTXieEw {
	NI32 a;
	NI32 b;
};
struct tySequence__F1ji846yIiKV9cZCihYOWUQ {
  TGenericSeq Sup;
  tyObject_Node__sp9aV9b8OMlkmM20y0mcfZfA data[SEQ_DECL_SIZE];
};
struct tySequence__9aKpvUh0ca6Bp9cKAwrowqUg {
  TGenericSeq Sup;
  NI16 data[SEQ_DECL_SIZE];
};
struct tySequence__lSdKeSXbofjQu7xoyTw4tw {
  TGenericSeq Sup;
  tyEnum_Flag__h2WPr03XhVS16ye9c9c1nXtw data[SEQ_DECL_SIZE];
};
struct tySequence__U5QYqmtUND3fb25zvpemlg {
  TGenericSeq Sup;
  tyTuple__Ll5iolPASSzOEheeSNjmiw data[SEQ_DECL_SIZE];
};
struct tySequence__oq9bTfdMDX9b8UeCqnryMnGg {
  TGenericSeq Sup;
  tyObject_HSlice__QARZZod9cmcZIctCtTXieEw data[SEQ_DECL_SIZE];
};
N_LIB_PRIVATE N_NIMCALL(NIM_BOOL, canOpt__OOZOOZOOZOOZOOZstorageZOnimbleZpkgs50Zregex4548O5051O48455657525454caa515351b535549cdcd56505549f50c555755ba50c4953a5657f50ZregexZlitopt_u729)(tyObject_LitOpt__rBp0MZMRZP7rBikF9bpiiNg litOpt_p0) {
	NIM_BOOL result;
	NI T1_;
{	result = (NIM_BOOL)0;
	T1_ = (litOpt_p0.nfa.s ? litOpt_p0.nfa.s->Sup.len : 0);
	result = (((NI)0) < T1_);
	goto BeforeRet_;
	}BeforeRet_: ;
	return result;
}
