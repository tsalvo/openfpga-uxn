-- Timing params:
--   Fixed?: True
--   Pipeline Slices: []
--   Input regs?: False
--   Output regs?: False
library std;
use std.textio.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 88
entity jcn2_0CLK_bbbe252c is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jcn2_0CLK_bbbe252c;
architecture arch of jcn2_0CLK_bbbe252c is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l634_c6_e514]
signal BIN_OP_EQ_uxn_opcodes_h_l634_c6_e514_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l634_c6_e514_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l634_c6_e514_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l634_c1_893c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l634_c1_893c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l634_c1_893c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l634_c1_893c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l634_c1_893c_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l634_c2_3150]
signal n8_MUX_uxn_opcodes_h_l634_c2_3150_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l634_c2_3150_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l634_c2_3150_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l634_c2_3150_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l634_c2_3150]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l634_c2_3150_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l634_c2_3150_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l634_c2_3150_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l634_c2_3150_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l634_c2_3150]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l634_c2_3150_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l634_c2_3150_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l634_c2_3150_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l634_c2_3150_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l634_c2_3150]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l634_c2_3150_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l634_c2_3150_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l634_c2_3150_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l634_c2_3150_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l634_c2_3150]
signal result_is_stack_read_MUX_uxn_opcodes_h_l634_c2_3150_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l634_c2_3150_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l634_c2_3150_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l634_c2_3150_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l634_c2_3150]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l634_c2_3150_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l634_c2_3150_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l634_c2_3150_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l634_c2_3150_return_output : signed(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l634_c2_3150]
signal result_pc_MUX_uxn_opcodes_h_l634_c2_3150_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l634_c2_3150_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l634_c2_3150_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l634_c2_3150_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l634_c2_3150]
signal result_is_opc_done_MUX_uxn_opcodes_h_l634_c2_3150_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l634_c2_3150_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l634_c2_3150_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l634_c2_3150_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l634_c2_3150]
signal t16_MUX_uxn_opcodes_h_l634_c2_3150_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l634_c2_3150_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l634_c2_3150_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l634_c2_3150_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l635_c3_23f7[uxn_opcodes_h_l635_c3_23f7]
signal printf_uxn_opcodes_h_l635_c3_23f7_uxn_opcodes_h_l635_c3_23f7_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l640_c11_8842]
signal BIN_OP_EQ_uxn_opcodes_h_l640_c11_8842_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l640_c11_8842_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l640_c11_8842_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l640_c7_fe34]
signal n8_MUX_uxn_opcodes_h_l640_c7_fe34_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l640_c7_fe34_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l640_c7_fe34_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l640_c7_fe34_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l640_c7_fe34]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_fe34_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_fe34_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_fe34_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_fe34_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l640_c7_fe34]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c7_fe34_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c7_fe34_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c7_fe34_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c7_fe34_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l640_c7_fe34]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l640_c7_fe34_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l640_c7_fe34_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l640_c7_fe34_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l640_c7_fe34_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l640_c7_fe34]
signal result_is_stack_read_MUX_uxn_opcodes_h_l640_c7_fe34_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l640_c7_fe34_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l640_c7_fe34_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l640_c7_fe34_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l640_c7_fe34]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_fe34_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_fe34_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_fe34_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_fe34_return_output : signed(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l640_c7_fe34]
signal result_pc_MUX_uxn_opcodes_h_l640_c7_fe34_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l640_c7_fe34_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l640_c7_fe34_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l640_c7_fe34_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l640_c7_fe34]
signal result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_fe34_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_fe34_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_fe34_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_fe34_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l640_c7_fe34]
signal t16_MUX_uxn_opcodes_h_l640_c7_fe34_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l640_c7_fe34_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l640_c7_fe34_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l640_c7_fe34_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l643_c11_bf53]
signal BIN_OP_EQ_uxn_opcodes_h_l643_c11_bf53_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l643_c11_bf53_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l643_c11_bf53_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l643_c7_3702]
signal n8_MUX_uxn_opcodes_h_l643_c7_3702_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l643_c7_3702_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l643_c7_3702_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l643_c7_3702_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l643_c7_3702]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_3702_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_3702_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_3702_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_3702_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l643_c7_3702]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l643_c7_3702_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l643_c7_3702_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l643_c7_3702_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l643_c7_3702_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l643_c7_3702]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_3702_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_3702_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_3702_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_3702_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l643_c7_3702]
signal result_is_stack_read_MUX_uxn_opcodes_h_l643_c7_3702_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l643_c7_3702_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l643_c7_3702_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l643_c7_3702_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l643_c7_3702]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_3702_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_3702_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_3702_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_3702_return_output : signed(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l643_c7_3702]
signal result_pc_MUX_uxn_opcodes_h_l643_c7_3702_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l643_c7_3702_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l643_c7_3702_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l643_c7_3702_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l643_c7_3702]
signal result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_3702_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_3702_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_3702_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_3702_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l643_c7_3702]
signal t16_MUX_uxn_opcodes_h_l643_c7_3702_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l643_c7_3702_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l643_c7_3702_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l643_c7_3702_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l645_c3_b64c]
signal CONST_SL_8_uxn_opcodes_h_l645_c3_b64c_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l645_c3_b64c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l648_c11_4e42]
signal BIN_OP_EQ_uxn_opcodes_h_l648_c11_4e42_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l648_c11_4e42_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l648_c11_4e42_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l648_c7_1d6a]
signal n8_MUX_uxn_opcodes_h_l648_c7_1d6a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l648_c7_1d6a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l648_c7_1d6a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l648_c7_1d6a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l648_c7_1d6a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l648_c7_1d6a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l648_c7_1d6a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l648_c7_1d6a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l648_c7_1d6a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l648_c7_1d6a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l648_c7_1d6a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l648_c7_1d6a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l648_c7_1d6a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l648_c7_1d6a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l648_c7_1d6a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l648_c7_1d6a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l648_c7_1d6a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l648_c7_1d6a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l648_c7_1d6a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l648_c7_1d6a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l648_c7_1d6a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l648_c7_1d6a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l648_c7_1d6a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output : signed(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l648_c7_1d6a]
signal result_pc_MUX_uxn_opcodes_h_l648_c7_1d6a_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l648_c7_1d6a_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l648_c7_1d6a_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l648_c7_1d6a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l648_c7_1d6a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l648_c7_1d6a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l648_c7_1d6a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l648_c7_1d6a]
signal t16_MUX_uxn_opcodes_h_l648_c7_1d6a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l648_c7_1d6a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l648_c7_1d6a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l651_c11_6e2e]
signal BIN_OP_EQ_uxn_opcodes_h_l651_c11_6e2e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l651_c11_6e2e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l651_c11_6e2e_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l651_c7_47d2]
signal n8_MUX_uxn_opcodes_h_l651_c7_47d2_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l651_c7_47d2_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l651_c7_47d2_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l651_c7_47d2_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l651_c7_47d2]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l651_c7_47d2_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l651_c7_47d2_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l651_c7_47d2_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l651_c7_47d2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l651_c7_47d2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l651_c7_47d2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l651_c7_47d2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l651_c7_47d2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l651_c7_47d2_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l651_c7_47d2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l651_c7_47d2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l651_c7_47d2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l651_c7_47d2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l651_c7_47d2_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l651_c7_47d2]
signal result_is_stack_read_MUX_uxn_opcodes_h_l651_c7_47d2_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l651_c7_47d2_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l651_c7_47d2_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l651_c7_47d2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l651_c7_47d2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l651_c7_47d2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l651_c7_47d2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l651_c7_47d2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l651_c7_47d2_return_output : signed(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l651_c7_47d2]
signal result_pc_MUX_uxn_opcodes_h_l651_c7_47d2_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l651_c7_47d2_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l651_c7_47d2_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l651_c7_47d2_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l651_c7_47d2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l651_c7_47d2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l651_c7_47d2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l651_c7_47d2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l651_c7_47d2_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l651_c7_47d2]
signal t16_MUX_uxn_opcodes_h_l651_c7_47d2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l651_c7_47d2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l651_c7_47d2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l651_c7_47d2_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l652_c3_a9c7]
signal BIN_OP_OR_uxn_opcodes_h_l652_c3_a9c7_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l652_c3_a9c7_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l652_c3_a9c7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l655_c11_a646]
signal BIN_OP_EQ_uxn_opcodes_h_l655_c11_a646_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l655_c11_a646_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l655_c11_a646_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l655_c7_1e94]
signal n8_MUX_uxn_opcodes_h_l655_c7_1e94_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l655_c7_1e94_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l655_c7_1e94_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l655_c7_1e94_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l655_c7_1e94]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_1e94_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_1e94_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_1e94_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_1e94_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l655_c7_1e94]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_1e94_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_1e94_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_1e94_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_1e94_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l655_c7_1e94]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_1e94_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_1e94_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_1e94_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_1e94_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l655_c7_1e94]
signal result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_1e94_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_1e94_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_1e94_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_1e94_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l655_c7_1e94]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_1e94_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_1e94_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_1e94_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_1e94_return_output : signed(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l655_c7_1e94]
signal result_pc_MUX_uxn_opcodes_h_l655_c7_1e94_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l655_c7_1e94_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l655_c7_1e94_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l655_c7_1e94_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l655_c7_1e94]
signal result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_1e94_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_1e94_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_1e94_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_1e94_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l658_c11_27fa]
signal BIN_OP_EQ_uxn_opcodes_h_l658_c11_27fa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l658_c11_27fa_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l658_c11_27fa_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l658_c7_4f78]
signal n8_MUX_uxn_opcodes_h_l658_c7_4f78_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l658_c7_4f78_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l658_c7_4f78_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l658_c7_4f78_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l658_c7_4f78]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l658_c7_4f78_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l658_c7_4f78_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l658_c7_4f78_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l658_c7_4f78_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l658_c7_4f78]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c7_4f78_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c7_4f78_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c7_4f78_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c7_4f78_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l658_c7_4f78]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l658_c7_4f78_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l658_c7_4f78_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l658_c7_4f78_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l658_c7_4f78_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l658_c7_4f78]
signal result_is_stack_read_MUX_uxn_opcodes_h_l658_c7_4f78_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l658_c7_4f78_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l658_c7_4f78_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l658_c7_4f78_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l658_c7_4f78]
signal result_pc_MUX_uxn_opcodes_h_l658_c7_4f78_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l658_c7_4f78_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l658_c7_4f78_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l658_c7_4f78_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l658_c7_4f78]
signal result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_4f78_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_4f78_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_4f78_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_4f78_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l662_c32_17cd]
signal BIN_OP_AND_uxn_opcodes_h_l662_c32_17cd_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l662_c32_17cd_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l662_c32_17cd_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l662_c32_40e6]
signal BIN_OP_GT_uxn_opcodes_h_l662_c32_40e6_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l662_c32_40e6_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l662_c32_40e6_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l662_c32_e9f4]
signal MUX_uxn_opcodes_h_l662_c32_e9f4_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l662_c32_e9f4_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l662_c32_e9f4_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l662_c32_e9f4_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l664_c11_4b43]
signal BIN_OP_EQ_uxn_opcodes_h_l664_c11_4b43_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l664_c11_4b43_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l664_c11_4b43_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l664_c7_3d85]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l664_c7_3d85_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l664_c7_3d85_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l664_c7_3d85_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l664_c7_3d85_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l664_c7_3d85]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l664_c7_3d85_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l664_c7_3d85_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l664_c7_3d85_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l664_c7_3d85_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l664_c7_3d85]
signal result_pc_MUX_uxn_opcodes_h_l664_c7_3d85_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l664_c7_3d85_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l664_c7_3d85_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l664_c7_3d85_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l664_c7_3d85]
signal result_is_opc_done_MUX_uxn_opcodes_h_l664_c7_3d85_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l664_c7_3d85_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l664_c7_3d85_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l664_c7_3d85_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l666_c26_9a59]
signal BIN_OP_EQ_uxn_opcodes_h_l666_c26_9a59_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l666_c26_9a59_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l666_c26_9a59_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l666_c26_35da]
signal MUX_uxn_opcodes_h_l666_c26_35da_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l666_c26_35da_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l666_c26_35da_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l666_c26_35da_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l667_c15_236d]
signal BIN_OP_EQ_uxn_opcodes_h_l667_c15_236d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l667_c15_236d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l667_c15_236d_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l667_c15_c1a2]
signal MUX_uxn_opcodes_h_l667_c15_c1a2_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l667_c15_c1a2_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l667_c15_c1a2_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l667_c15_c1a2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l669_c11_6a0d]
signal BIN_OP_EQ_uxn_opcodes_h_l669_c11_6a0d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l669_c11_6a0d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l669_c11_6a0d_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l669_c7_175d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l669_c7_175d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l669_c7_175d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l669_c7_175d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l669_c7_175d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l669_c7_175d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_175d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_175d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_175d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_175d_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_babf( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_pc_updated := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_stack_read := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.pc := ref_toks_6;
      base.is_opc_done := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l634_c6_e514
BIN_OP_EQ_uxn_opcodes_h_l634_c6_e514 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l634_c6_e514_left,
BIN_OP_EQ_uxn_opcodes_h_l634_c6_e514_right,
BIN_OP_EQ_uxn_opcodes_h_l634_c6_e514_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l634_c1_893c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l634_c1_893c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l634_c1_893c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l634_c1_893c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l634_c1_893c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l634_c1_893c_return_output);

-- n8_MUX_uxn_opcodes_h_l634_c2_3150
n8_MUX_uxn_opcodes_h_l634_c2_3150 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l634_c2_3150_cond,
n8_MUX_uxn_opcodes_h_l634_c2_3150_iftrue,
n8_MUX_uxn_opcodes_h_l634_c2_3150_iffalse,
n8_MUX_uxn_opcodes_h_l634_c2_3150_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l634_c2_3150
result_is_pc_updated_MUX_uxn_opcodes_h_l634_c2_3150 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l634_c2_3150_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l634_c2_3150_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l634_c2_3150_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l634_c2_3150_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l634_c2_3150
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l634_c2_3150 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l634_c2_3150_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l634_c2_3150_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l634_c2_3150_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l634_c2_3150_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l634_c2_3150
result_is_sp_shift_MUX_uxn_opcodes_h_l634_c2_3150 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l634_c2_3150_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l634_c2_3150_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l634_c2_3150_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l634_c2_3150_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l634_c2_3150
result_is_stack_read_MUX_uxn_opcodes_h_l634_c2_3150 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l634_c2_3150_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l634_c2_3150_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l634_c2_3150_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l634_c2_3150_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l634_c2_3150
result_sp_relative_shift_MUX_uxn_opcodes_h_l634_c2_3150 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l634_c2_3150_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l634_c2_3150_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l634_c2_3150_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l634_c2_3150_return_output);

-- result_pc_MUX_uxn_opcodes_h_l634_c2_3150
result_pc_MUX_uxn_opcodes_h_l634_c2_3150 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l634_c2_3150_cond,
result_pc_MUX_uxn_opcodes_h_l634_c2_3150_iftrue,
result_pc_MUX_uxn_opcodes_h_l634_c2_3150_iffalse,
result_pc_MUX_uxn_opcodes_h_l634_c2_3150_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l634_c2_3150
result_is_opc_done_MUX_uxn_opcodes_h_l634_c2_3150 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l634_c2_3150_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l634_c2_3150_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l634_c2_3150_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l634_c2_3150_return_output);

-- t16_MUX_uxn_opcodes_h_l634_c2_3150
t16_MUX_uxn_opcodes_h_l634_c2_3150 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l634_c2_3150_cond,
t16_MUX_uxn_opcodes_h_l634_c2_3150_iftrue,
t16_MUX_uxn_opcodes_h_l634_c2_3150_iffalse,
t16_MUX_uxn_opcodes_h_l634_c2_3150_return_output);

-- printf_uxn_opcodes_h_l635_c3_23f7_uxn_opcodes_h_l635_c3_23f7
printf_uxn_opcodes_h_l635_c3_23f7_uxn_opcodes_h_l635_c3_23f7 : entity work.printf_uxn_opcodes_h_l635_c3_23f7_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l635_c3_23f7_uxn_opcodes_h_l635_c3_23f7_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l640_c11_8842
BIN_OP_EQ_uxn_opcodes_h_l640_c11_8842 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l640_c11_8842_left,
BIN_OP_EQ_uxn_opcodes_h_l640_c11_8842_right,
BIN_OP_EQ_uxn_opcodes_h_l640_c11_8842_return_output);

-- n8_MUX_uxn_opcodes_h_l640_c7_fe34
n8_MUX_uxn_opcodes_h_l640_c7_fe34 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l640_c7_fe34_cond,
n8_MUX_uxn_opcodes_h_l640_c7_fe34_iftrue,
n8_MUX_uxn_opcodes_h_l640_c7_fe34_iffalse,
n8_MUX_uxn_opcodes_h_l640_c7_fe34_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_fe34
result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_fe34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_fe34_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_fe34_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_fe34_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_fe34_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c7_fe34
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c7_fe34 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c7_fe34_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c7_fe34_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c7_fe34_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c7_fe34_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l640_c7_fe34
result_is_sp_shift_MUX_uxn_opcodes_h_l640_c7_fe34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l640_c7_fe34_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l640_c7_fe34_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l640_c7_fe34_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l640_c7_fe34_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l640_c7_fe34
result_is_stack_read_MUX_uxn_opcodes_h_l640_c7_fe34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l640_c7_fe34_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l640_c7_fe34_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l640_c7_fe34_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l640_c7_fe34_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_fe34
result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_fe34 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_fe34_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_fe34_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_fe34_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_fe34_return_output);

-- result_pc_MUX_uxn_opcodes_h_l640_c7_fe34
result_pc_MUX_uxn_opcodes_h_l640_c7_fe34 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l640_c7_fe34_cond,
result_pc_MUX_uxn_opcodes_h_l640_c7_fe34_iftrue,
result_pc_MUX_uxn_opcodes_h_l640_c7_fe34_iffalse,
result_pc_MUX_uxn_opcodes_h_l640_c7_fe34_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_fe34
result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_fe34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_fe34_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_fe34_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_fe34_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_fe34_return_output);

-- t16_MUX_uxn_opcodes_h_l640_c7_fe34
t16_MUX_uxn_opcodes_h_l640_c7_fe34 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l640_c7_fe34_cond,
t16_MUX_uxn_opcodes_h_l640_c7_fe34_iftrue,
t16_MUX_uxn_opcodes_h_l640_c7_fe34_iffalse,
t16_MUX_uxn_opcodes_h_l640_c7_fe34_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l643_c11_bf53
BIN_OP_EQ_uxn_opcodes_h_l643_c11_bf53 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l643_c11_bf53_left,
BIN_OP_EQ_uxn_opcodes_h_l643_c11_bf53_right,
BIN_OP_EQ_uxn_opcodes_h_l643_c11_bf53_return_output);

-- n8_MUX_uxn_opcodes_h_l643_c7_3702
n8_MUX_uxn_opcodes_h_l643_c7_3702 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l643_c7_3702_cond,
n8_MUX_uxn_opcodes_h_l643_c7_3702_iftrue,
n8_MUX_uxn_opcodes_h_l643_c7_3702_iffalse,
n8_MUX_uxn_opcodes_h_l643_c7_3702_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_3702
result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_3702 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_3702_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_3702_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_3702_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_3702_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l643_c7_3702
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l643_c7_3702 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l643_c7_3702_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l643_c7_3702_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l643_c7_3702_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l643_c7_3702_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_3702
result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_3702 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_3702_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_3702_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_3702_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_3702_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l643_c7_3702
result_is_stack_read_MUX_uxn_opcodes_h_l643_c7_3702 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l643_c7_3702_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l643_c7_3702_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l643_c7_3702_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l643_c7_3702_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_3702
result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_3702 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_3702_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_3702_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_3702_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_3702_return_output);

-- result_pc_MUX_uxn_opcodes_h_l643_c7_3702
result_pc_MUX_uxn_opcodes_h_l643_c7_3702 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l643_c7_3702_cond,
result_pc_MUX_uxn_opcodes_h_l643_c7_3702_iftrue,
result_pc_MUX_uxn_opcodes_h_l643_c7_3702_iffalse,
result_pc_MUX_uxn_opcodes_h_l643_c7_3702_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_3702
result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_3702 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_3702_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_3702_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_3702_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_3702_return_output);

-- t16_MUX_uxn_opcodes_h_l643_c7_3702
t16_MUX_uxn_opcodes_h_l643_c7_3702 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l643_c7_3702_cond,
t16_MUX_uxn_opcodes_h_l643_c7_3702_iftrue,
t16_MUX_uxn_opcodes_h_l643_c7_3702_iffalse,
t16_MUX_uxn_opcodes_h_l643_c7_3702_return_output);

-- CONST_SL_8_uxn_opcodes_h_l645_c3_b64c
CONST_SL_8_uxn_opcodes_h_l645_c3_b64c : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l645_c3_b64c_x,
CONST_SL_8_uxn_opcodes_h_l645_c3_b64c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l648_c11_4e42
BIN_OP_EQ_uxn_opcodes_h_l648_c11_4e42 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l648_c11_4e42_left,
BIN_OP_EQ_uxn_opcodes_h_l648_c11_4e42_right,
BIN_OP_EQ_uxn_opcodes_h_l648_c11_4e42_return_output);

-- n8_MUX_uxn_opcodes_h_l648_c7_1d6a
n8_MUX_uxn_opcodes_h_l648_c7_1d6a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l648_c7_1d6a_cond,
n8_MUX_uxn_opcodes_h_l648_c7_1d6a_iftrue,
n8_MUX_uxn_opcodes_h_l648_c7_1d6a_iffalse,
n8_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l648_c7_1d6a
result_is_pc_updated_MUX_uxn_opcodes_h_l648_c7_1d6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l648_c7_1d6a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l648_c7_1d6a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l648_c7_1d6a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l648_c7_1d6a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l648_c7_1d6a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l648_c7_1d6a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l648_c7_1d6a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l648_c7_1d6a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l648_c7_1d6a
result_is_sp_shift_MUX_uxn_opcodes_h_l648_c7_1d6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l648_c7_1d6a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l648_c7_1d6a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l648_c7_1d6a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l648_c7_1d6a
result_is_stack_read_MUX_uxn_opcodes_h_l648_c7_1d6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l648_c7_1d6a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l648_c7_1d6a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l648_c7_1d6a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l648_c7_1d6a
result_sp_relative_shift_MUX_uxn_opcodes_h_l648_c7_1d6a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l648_c7_1d6a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l648_c7_1d6a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l648_c7_1d6a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output);

-- result_pc_MUX_uxn_opcodes_h_l648_c7_1d6a
result_pc_MUX_uxn_opcodes_h_l648_c7_1d6a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l648_c7_1d6a_cond,
result_pc_MUX_uxn_opcodes_h_l648_c7_1d6a_iftrue,
result_pc_MUX_uxn_opcodes_h_l648_c7_1d6a_iffalse,
result_pc_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l648_c7_1d6a
result_is_opc_done_MUX_uxn_opcodes_h_l648_c7_1d6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l648_c7_1d6a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l648_c7_1d6a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l648_c7_1d6a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output);

-- t16_MUX_uxn_opcodes_h_l648_c7_1d6a
t16_MUX_uxn_opcodes_h_l648_c7_1d6a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l648_c7_1d6a_cond,
t16_MUX_uxn_opcodes_h_l648_c7_1d6a_iftrue,
t16_MUX_uxn_opcodes_h_l648_c7_1d6a_iffalse,
t16_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l651_c11_6e2e
BIN_OP_EQ_uxn_opcodes_h_l651_c11_6e2e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l651_c11_6e2e_left,
BIN_OP_EQ_uxn_opcodes_h_l651_c11_6e2e_right,
BIN_OP_EQ_uxn_opcodes_h_l651_c11_6e2e_return_output);

-- n8_MUX_uxn_opcodes_h_l651_c7_47d2
n8_MUX_uxn_opcodes_h_l651_c7_47d2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l651_c7_47d2_cond,
n8_MUX_uxn_opcodes_h_l651_c7_47d2_iftrue,
n8_MUX_uxn_opcodes_h_l651_c7_47d2_iffalse,
n8_MUX_uxn_opcodes_h_l651_c7_47d2_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l651_c7_47d2
result_is_pc_updated_MUX_uxn_opcodes_h_l651_c7_47d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l651_c7_47d2_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l651_c7_47d2_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l651_c7_47d2_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l651_c7_47d2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l651_c7_47d2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l651_c7_47d2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l651_c7_47d2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l651_c7_47d2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l651_c7_47d2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l651_c7_47d2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l651_c7_47d2
result_is_sp_shift_MUX_uxn_opcodes_h_l651_c7_47d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l651_c7_47d2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l651_c7_47d2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l651_c7_47d2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l651_c7_47d2_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l651_c7_47d2
result_is_stack_read_MUX_uxn_opcodes_h_l651_c7_47d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l651_c7_47d2_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l651_c7_47d2_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l651_c7_47d2_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l651_c7_47d2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l651_c7_47d2
result_sp_relative_shift_MUX_uxn_opcodes_h_l651_c7_47d2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l651_c7_47d2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l651_c7_47d2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l651_c7_47d2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l651_c7_47d2_return_output);

-- result_pc_MUX_uxn_opcodes_h_l651_c7_47d2
result_pc_MUX_uxn_opcodes_h_l651_c7_47d2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l651_c7_47d2_cond,
result_pc_MUX_uxn_opcodes_h_l651_c7_47d2_iftrue,
result_pc_MUX_uxn_opcodes_h_l651_c7_47d2_iffalse,
result_pc_MUX_uxn_opcodes_h_l651_c7_47d2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l651_c7_47d2
result_is_opc_done_MUX_uxn_opcodes_h_l651_c7_47d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l651_c7_47d2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l651_c7_47d2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l651_c7_47d2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l651_c7_47d2_return_output);

-- t16_MUX_uxn_opcodes_h_l651_c7_47d2
t16_MUX_uxn_opcodes_h_l651_c7_47d2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l651_c7_47d2_cond,
t16_MUX_uxn_opcodes_h_l651_c7_47d2_iftrue,
t16_MUX_uxn_opcodes_h_l651_c7_47d2_iffalse,
t16_MUX_uxn_opcodes_h_l651_c7_47d2_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l652_c3_a9c7
BIN_OP_OR_uxn_opcodes_h_l652_c3_a9c7 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l652_c3_a9c7_left,
BIN_OP_OR_uxn_opcodes_h_l652_c3_a9c7_right,
BIN_OP_OR_uxn_opcodes_h_l652_c3_a9c7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l655_c11_a646
BIN_OP_EQ_uxn_opcodes_h_l655_c11_a646 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l655_c11_a646_left,
BIN_OP_EQ_uxn_opcodes_h_l655_c11_a646_right,
BIN_OP_EQ_uxn_opcodes_h_l655_c11_a646_return_output);

-- n8_MUX_uxn_opcodes_h_l655_c7_1e94
n8_MUX_uxn_opcodes_h_l655_c7_1e94 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l655_c7_1e94_cond,
n8_MUX_uxn_opcodes_h_l655_c7_1e94_iftrue,
n8_MUX_uxn_opcodes_h_l655_c7_1e94_iffalse,
n8_MUX_uxn_opcodes_h_l655_c7_1e94_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_1e94
result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_1e94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_1e94_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_1e94_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_1e94_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_1e94_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_1e94
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_1e94 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_1e94_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_1e94_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_1e94_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_1e94_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_1e94
result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_1e94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_1e94_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_1e94_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_1e94_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_1e94_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_1e94
result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_1e94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_1e94_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_1e94_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_1e94_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_1e94_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_1e94
result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_1e94 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_1e94_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_1e94_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_1e94_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_1e94_return_output);

-- result_pc_MUX_uxn_opcodes_h_l655_c7_1e94
result_pc_MUX_uxn_opcodes_h_l655_c7_1e94 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l655_c7_1e94_cond,
result_pc_MUX_uxn_opcodes_h_l655_c7_1e94_iftrue,
result_pc_MUX_uxn_opcodes_h_l655_c7_1e94_iffalse,
result_pc_MUX_uxn_opcodes_h_l655_c7_1e94_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_1e94
result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_1e94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_1e94_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_1e94_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_1e94_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_1e94_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l658_c11_27fa
BIN_OP_EQ_uxn_opcodes_h_l658_c11_27fa : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l658_c11_27fa_left,
BIN_OP_EQ_uxn_opcodes_h_l658_c11_27fa_right,
BIN_OP_EQ_uxn_opcodes_h_l658_c11_27fa_return_output);

-- n8_MUX_uxn_opcodes_h_l658_c7_4f78
n8_MUX_uxn_opcodes_h_l658_c7_4f78 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l658_c7_4f78_cond,
n8_MUX_uxn_opcodes_h_l658_c7_4f78_iftrue,
n8_MUX_uxn_opcodes_h_l658_c7_4f78_iffalse,
n8_MUX_uxn_opcodes_h_l658_c7_4f78_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l658_c7_4f78
result_is_pc_updated_MUX_uxn_opcodes_h_l658_c7_4f78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l658_c7_4f78_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l658_c7_4f78_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l658_c7_4f78_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l658_c7_4f78_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c7_4f78
result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c7_4f78 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c7_4f78_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c7_4f78_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c7_4f78_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c7_4f78_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l658_c7_4f78
result_is_sp_shift_MUX_uxn_opcodes_h_l658_c7_4f78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l658_c7_4f78_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l658_c7_4f78_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l658_c7_4f78_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l658_c7_4f78_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l658_c7_4f78
result_is_stack_read_MUX_uxn_opcodes_h_l658_c7_4f78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l658_c7_4f78_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l658_c7_4f78_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l658_c7_4f78_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l658_c7_4f78_return_output);

-- result_pc_MUX_uxn_opcodes_h_l658_c7_4f78
result_pc_MUX_uxn_opcodes_h_l658_c7_4f78 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l658_c7_4f78_cond,
result_pc_MUX_uxn_opcodes_h_l658_c7_4f78_iftrue,
result_pc_MUX_uxn_opcodes_h_l658_c7_4f78_iffalse,
result_pc_MUX_uxn_opcodes_h_l658_c7_4f78_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_4f78
result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_4f78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_4f78_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_4f78_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_4f78_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_4f78_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l662_c32_17cd
BIN_OP_AND_uxn_opcodes_h_l662_c32_17cd : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l662_c32_17cd_left,
BIN_OP_AND_uxn_opcodes_h_l662_c32_17cd_right,
BIN_OP_AND_uxn_opcodes_h_l662_c32_17cd_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l662_c32_40e6
BIN_OP_GT_uxn_opcodes_h_l662_c32_40e6 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l662_c32_40e6_left,
BIN_OP_GT_uxn_opcodes_h_l662_c32_40e6_right,
BIN_OP_GT_uxn_opcodes_h_l662_c32_40e6_return_output);

-- MUX_uxn_opcodes_h_l662_c32_e9f4
MUX_uxn_opcodes_h_l662_c32_e9f4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l662_c32_e9f4_cond,
MUX_uxn_opcodes_h_l662_c32_e9f4_iftrue,
MUX_uxn_opcodes_h_l662_c32_e9f4_iffalse,
MUX_uxn_opcodes_h_l662_c32_e9f4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l664_c11_4b43
BIN_OP_EQ_uxn_opcodes_h_l664_c11_4b43 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l664_c11_4b43_left,
BIN_OP_EQ_uxn_opcodes_h_l664_c11_4b43_right,
BIN_OP_EQ_uxn_opcodes_h_l664_c11_4b43_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l664_c7_3d85
result_is_sp_shift_MUX_uxn_opcodes_h_l664_c7_3d85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l664_c7_3d85_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l664_c7_3d85_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l664_c7_3d85_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l664_c7_3d85_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l664_c7_3d85
result_is_pc_updated_MUX_uxn_opcodes_h_l664_c7_3d85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l664_c7_3d85_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l664_c7_3d85_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l664_c7_3d85_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l664_c7_3d85_return_output);

-- result_pc_MUX_uxn_opcodes_h_l664_c7_3d85
result_pc_MUX_uxn_opcodes_h_l664_c7_3d85 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l664_c7_3d85_cond,
result_pc_MUX_uxn_opcodes_h_l664_c7_3d85_iftrue,
result_pc_MUX_uxn_opcodes_h_l664_c7_3d85_iffalse,
result_pc_MUX_uxn_opcodes_h_l664_c7_3d85_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l664_c7_3d85
result_is_opc_done_MUX_uxn_opcodes_h_l664_c7_3d85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l664_c7_3d85_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l664_c7_3d85_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l664_c7_3d85_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l664_c7_3d85_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l666_c26_9a59
BIN_OP_EQ_uxn_opcodes_h_l666_c26_9a59 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l666_c26_9a59_left,
BIN_OP_EQ_uxn_opcodes_h_l666_c26_9a59_right,
BIN_OP_EQ_uxn_opcodes_h_l666_c26_9a59_return_output);

-- MUX_uxn_opcodes_h_l666_c26_35da
MUX_uxn_opcodes_h_l666_c26_35da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l666_c26_35da_cond,
MUX_uxn_opcodes_h_l666_c26_35da_iftrue,
MUX_uxn_opcodes_h_l666_c26_35da_iffalse,
MUX_uxn_opcodes_h_l666_c26_35da_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l667_c15_236d
BIN_OP_EQ_uxn_opcodes_h_l667_c15_236d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l667_c15_236d_left,
BIN_OP_EQ_uxn_opcodes_h_l667_c15_236d_right,
BIN_OP_EQ_uxn_opcodes_h_l667_c15_236d_return_output);

-- MUX_uxn_opcodes_h_l667_c15_c1a2
MUX_uxn_opcodes_h_l667_c15_c1a2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l667_c15_c1a2_cond,
MUX_uxn_opcodes_h_l667_c15_c1a2_iftrue,
MUX_uxn_opcodes_h_l667_c15_c1a2_iffalse,
MUX_uxn_opcodes_h_l667_c15_c1a2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l669_c11_6a0d
BIN_OP_EQ_uxn_opcodes_h_l669_c11_6a0d : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l669_c11_6a0d_left,
BIN_OP_EQ_uxn_opcodes_h_l669_c11_6a0d_right,
BIN_OP_EQ_uxn_opcodes_h_l669_c11_6a0d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l669_c7_175d
result_is_pc_updated_MUX_uxn_opcodes_h_l669_c7_175d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l669_c7_175d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l669_c7_175d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l669_c7_175d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l669_c7_175d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_175d
result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_175d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_175d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_175d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_175d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_175d_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l634_c6_e514_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l634_c1_893c_return_output,
 n8_MUX_uxn_opcodes_h_l634_c2_3150_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l634_c2_3150_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l634_c2_3150_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l634_c2_3150_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l634_c2_3150_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l634_c2_3150_return_output,
 result_pc_MUX_uxn_opcodes_h_l634_c2_3150_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l634_c2_3150_return_output,
 t16_MUX_uxn_opcodes_h_l634_c2_3150_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l640_c11_8842_return_output,
 n8_MUX_uxn_opcodes_h_l640_c7_fe34_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_fe34_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c7_fe34_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l640_c7_fe34_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l640_c7_fe34_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_fe34_return_output,
 result_pc_MUX_uxn_opcodes_h_l640_c7_fe34_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_fe34_return_output,
 t16_MUX_uxn_opcodes_h_l640_c7_fe34_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l643_c11_bf53_return_output,
 n8_MUX_uxn_opcodes_h_l643_c7_3702_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_3702_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l643_c7_3702_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_3702_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l643_c7_3702_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_3702_return_output,
 result_pc_MUX_uxn_opcodes_h_l643_c7_3702_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_3702_return_output,
 t16_MUX_uxn_opcodes_h_l643_c7_3702_return_output,
 CONST_SL_8_uxn_opcodes_h_l645_c3_b64c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l648_c11_4e42_return_output,
 n8_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output,
 result_pc_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output,
 t16_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l651_c11_6e2e_return_output,
 n8_MUX_uxn_opcodes_h_l651_c7_47d2_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l651_c7_47d2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l651_c7_47d2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l651_c7_47d2_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l651_c7_47d2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l651_c7_47d2_return_output,
 result_pc_MUX_uxn_opcodes_h_l651_c7_47d2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l651_c7_47d2_return_output,
 t16_MUX_uxn_opcodes_h_l651_c7_47d2_return_output,
 BIN_OP_OR_uxn_opcodes_h_l652_c3_a9c7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l655_c11_a646_return_output,
 n8_MUX_uxn_opcodes_h_l655_c7_1e94_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_1e94_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_1e94_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_1e94_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_1e94_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_1e94_return_output,
 result_pc_MUX_uxn_opcodes_h_l655_c7_1e94_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_1e94_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l658_c11_27fa_return_output,
 n8_MUX_uxn_opcodes_h_l658_c7_4f78_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l658_c7_4f78_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c7_4f78_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l658_c7_4f78_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l658_c7_4f78_return_output,
 result_pc_MUX_uxn_opcodes_h_l658_c7_4f78_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_4f78_return_output,
 BIN_OP_AND_uxn_opcodes_h_l662_c32_17cd_return_output,
 BIN_OP_GT_uxn_opcodes_h_l662_c32_40e6_return_output,
 MUX_uxn_opcodes_h_l662_c32_e9f4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l664_c11_4b43_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l664_c7_3d85_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l664_c7_3d85_return_output,
 result_pc_MUX_uxn_opcodes_h_l664_c7_3d85_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l664_c7_3d85_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l666_c26_9a59_return_output,
 MUX_uxn_opcodes_h_l666_c26_35da_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l667_c15_236d_return_output,
 MUX_uxn_opcodes_h_l667_c15_c1a2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l669_c11_6a0d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l669_c7_175d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_175d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l634_c6_e514_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l634_c6_e514_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l634_c6_e514_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l634_c1_893c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l634_c1_893c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l634_c1_893c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l634_c1_893c_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l634_c2_3150_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l634_c2_3150_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l640_c7_fe34_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l634_c2_3150_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l634_c2_3150_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l634_c2_3150_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l634_c2_3150_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_fe34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l634_c2_3150_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l634_c2_3150_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l634_c2_3150_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l637_c3_d560 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l634_c2_3150_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c7_fe34_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l634_c2_3150_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l634_c2_3150_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l634_c2_3150_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l634_c2_3150_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l640_c7_fe34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l634_c2_3150_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l634_c2_3150_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l634_c2_3150_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l634_c2_3150_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l640_c7_fe34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l634_c2_3150_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l634_c2_3150_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l634_c2_3150_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l634_c2_3150_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_fe34_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l634_c2_3150_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l634_c2_3150_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l634_c2_3150_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l634_c2_3150_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l640_c7_fe34_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l634_c2_3150_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l634_c2_3150_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l634_c2_3150_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l634_c2_3150_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_fe34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l634_c2_3150_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l634_c2_3150_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l634_c2_3150_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l634_c2_3150_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l640_c7_fe34_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l634_c2_3150_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l634_c2_3150_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l635_c3_23f7_uxn_opcodes_h_l635_c3_23f7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c11_8842_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c11_8842_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c11_8842_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l640_c7_fe34_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l640_c7_fe34_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l643_c7_3702_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l640_c7_fe34_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_fe34_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_fe34_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_3702_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_fe34_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c7_fe34_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l641_c3_8875 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c7_fe34_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l643_c7_3702_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c7_fe34_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l640_c7_fe34_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l640_c7_fe34_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_3702_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l640_c7_fe34_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l640_c7_fe34_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l640_c7_fe34_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l643_c7_3702_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l640_c7_fe34_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_fe34_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_fe34_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_3702_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_fe34_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l640_c7_fe34_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l640_c7_fe34_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l643_c7_3702_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l640_c7_fe34_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_fe34_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_fe34_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_3702_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_fe34_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l640_c7_fe34_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l640_c7_fe34_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l643_c7_3702_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l640_c7_fe34_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_bf53_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_bf53_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_bf53_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l643_c7_3702_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l643_c7_3702_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l643_c7_3702_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_3702_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_3702_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_3702_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l643_c7_3702_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l646_c3_820a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l643_c7_3702_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l643_c7_3702_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_3702_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_3702_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_3702_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l643_c7_3702_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l643_c7_3702_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l643_c7_3702_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_3702_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_3702_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_3702_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l643_c7_3702_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l643_c7_3702_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l643_c7_3702_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_3702_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_3702_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_3702_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l643_c7_3702_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l643_c7_3702_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l643_c7_3702_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l645_c3_b64c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l645_c3_b64c_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l648_c11_4e42_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l648_c11_4e42_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l648_c11_4e42_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l648_c7_1d6a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l648_c7_1d6a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l651_c7_47d2_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l648_c7_1d6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l648_c7_1d6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l648_c7_1d6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l651_c7_47d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l648_c7_1d6a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l648_c7_1d6a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l649_c3_f5a2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l648_c7_1d6a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l651_c7_47d2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l648_c7_1d6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l648_c7_1d6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l648_c7_1d6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l651_c7_47d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l648_c7_1d6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l648_c7_1d6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l648_c7_1d6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l651_c7_47d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l648_c7_1d6a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l648_c7_1d6a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l648_c7_1d6a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l651_c7_47d2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l648_c7_1d6a_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l648_c7_1d6a_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l648_c7_1d6a_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l651_c7_47d2_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l648_c7_1d6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l648_c7_1d6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l648_c7_1d6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l651_c7_47d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l648_c7_1d6a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l648_c7_1d6a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l648_c7_1d6a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l651_c7_47d2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l648_c7_1d6a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l651_c11_6e2e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l651_c11_6e2e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l651_c11_6e2e_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l651_c7_47d2_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l651_c7_47d2_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l655_c7_1e94_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l651_c7_47d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l651_c7_47d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l651_c7_47d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_1e94_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l651_c7_47d2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l651_c7_47d2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l653_c3_3414 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l651_c7_47d2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_1e94_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l651_c7_47d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l651_c7_47d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l651_c7_47d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_1e94_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l651_c7_47d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l651_c7_47d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l651_c7_47d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_1e94_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l651_c7_47d2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l651_c7_47d2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l651_c7_47d2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_1e94_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l651_c7_47d2_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l651_c7_47d2_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l651_c7_47d2_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l655_c7_1e94_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l651_c7_47d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l651_c7_47d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l651_c7_47d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_1e94_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l651_c7_47d2_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l651_c7_47d2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l651_c7_47d2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l651_c7_47d2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l652_c3_a9c7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l652_c3_a9c7_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l652_c3_a9c7_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_a646_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_a646_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_a646_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l655_c7_1e94_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l655_c7_1e94_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l658_c7_4f78_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l655_c7_1e94_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_1e94_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_1e94_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c7_4f78_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_1e94_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_1e94_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l656_c3_ac43 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_1e94_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l655_c7_1e94_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_1e94_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_1e94_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_1e94_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l658_c7_4f78_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_1e94_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_1e94_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_1e94_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l658_c7_4f78_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_1e94_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_1e94_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_1e94_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c7_4f78_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_1e94_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l655_c7_1e94_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l655_c7_1e94_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l658_c7_4f78_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l655_c7_1e94_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_1e94_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_1e94_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_4f78_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_1e94_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c11_27fa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c11_27fa_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c11_27fa_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l658_c7_4f78_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l658_c7_4f78_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l658_c7_4f78_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c7_4f78_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c7_4f78_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l664_c7_3d85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c7_4f78_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c7_4f78_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c7_4f78_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c7_4f78_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l658_c7_4f78_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l658_c7_4f78_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l664_c7_3d85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l658_c7_4f78_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l658_c7_4f78_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l658_c7_4f78_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l658_c7_4f78_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l658_c7_4f78_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l658_c7_4f78_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l664_c7_3d85_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l658_c7_4f78_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_4f78_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_4f78_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l664_c7_3d85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_4f78_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l662_c32_e9f4_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l662_c32_e9f4_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l662_c32_e9f4_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l662_c32_17cd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l662_c32_17cd_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l662_c32_17cd_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l662_c32_40e6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l662_c32_40e6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l662_c32_40e6_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l662_c32_e9f4_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l664_c11_4b43_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l664_c11_4b43_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l664_c11_4b43_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l664_c7_3d85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l664_c7_3d85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l664_c7_3d85_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l664_c7_3d85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l664_c7_3d85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l669_c7_175d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l664_c7_3d85_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l664_c7_3d85_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l664_c7_3d85_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l664_c7_3d85_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l664_c7_3d85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l664_c7_3d85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_175d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l664_c7_3d85_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l666_c26_35da_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l666_c26_35da_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l666_c26_35da_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l666_c26_9a59_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l666_c26_9a59_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l666_c26_9a59_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l666_c26_35da_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l667_c15_c1a2_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l667_c15_c1a2_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l667_c15_c1a2_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l667_c15_236d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l667_c15_236d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l667_c15_236d_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l667_c15_c1a2_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_6a0d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_6a0d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_6a0d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l669_c7_175d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l669_c7_175d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l669_c7_175d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_175d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_175d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_175d_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l655_l651_l640_l634_l669_l643_l658_l648_DUPLICATE_8433_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l655_l651_l640_l634_l643_l648_l664_DUPLICATE_6f53_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l655_l651_l640_l634_l643_l658_l648_DUPLICATE_06e9_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l655_l651_l640_l634_l643_l658_l648_l664_DUPLICATE_2616_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l655_l651_l640_l643_l658_l648_DUPLICATE_16e1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l655_l651_l640_l669_l643_l658_l648_l664_DUPLICATE_8065_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l652_l644_DUPLICATE_4ca1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_babf_uxn_opcodes_h_l674_l629_DUPLICATE_3607_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l656_c3_ac43 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_1e94_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l656_c3_ac43;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l653_c3_3414 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l651_c7_47d2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l653_c3_3414;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_a646_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l641_c3_8875 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c7_fe34_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l641_c3_8875;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l666_c26_9a59_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l649_c3_f5a2 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l648_c7_1d6a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l649_c3_f5a2;
     VAR_BIN_OP_AND_uxn_opcodes_h_l662_c32_17cd_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l651_c11_6e2e_right := to_unsigned(4, 3);
     VAR_MUX_uxn_opcodes_h_l662_c32_e9f4_iffalse := resize(to_signed(-3, 3), 8);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l634_c2_3150_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l648_c11_4e42_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l664_c7_3d85_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l658_c7_4f78_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l667_c15_236d_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c11_27fa_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_6a0d_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c11_8842_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l634_c2_3150_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l634_c1_893c_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l646_c3_820a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l643_c7_3702_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l646_c3_820a;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l669_c7_175d_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l667_c15_c1a2_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_bf53_right := to_unsigned(2, 2);
     VAR_MUX_uxn_opcodes_h_l666_c26_35da_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l662_c32_40e6_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l662_c32_e9f4_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_175d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l634_c6_e514_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l637_c3_d560 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l634_c2_3150_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l637_c3_d560;
     VAR_MUX_uxn_opcodes_h_l666_c26_35da_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l664_c11_4b43_right := to_unsigned(7, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l658_c7_4f78_iftrue := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_previous_stack_read := previous_stack_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l634_c1_893c_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l662_c32_17cd_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l666_c26_9a59_left := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l667_c15_236d_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l634_c2_3150_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l640_c7_fe34_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l643_c7_3702_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l648_c7_1d6a_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l651_c7_47d2_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l655_c7_1e94_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l658_c7_4f78_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l634_c6_e514_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c11_8842_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_bf53_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l648_c11_4e42_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l651_c11_6e2e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_a646_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c11_27fa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l664_c11_4b43_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_6a0d_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l658_c7_4f78_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l652_c3_a9c7_left := t16;
     VAR_MUX_uxn_opcodes_h_l667_c15_c1a2_iffalse := t16;
     VAR_t16_MUX_uxn_opcodes_h_l634_c2_3150_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l640_c7_fe34_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l648_c7_1d6a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l651_c7_47d2_iffalse := t16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l655_l651_l640_l643_l658_l648_DUPLICATE_16e1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l655_l651_l640_l643_l658_l648_DUPLICATE_16e1_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l664_c11_4b43] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l664_c11_4b43_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l664_c11_4b43_left;
     BIN_OP_EQ_uxn_opcodes_h_l664_c11_4b43_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l664_c11_4b43_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l664_c11_4b43_return_output := BIN_OP_EQ_uxn_opcodes_h_l664_c11_4b43_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l655_c11_a646] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l655_c11_a646_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_a646_left;
     BIN_OP_EQ_uxn_opcodes_h_l655_c11_a646_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_a646_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_a646_return_output := BIN_OP_EQ_uxn_opcodes_h_l655_c11_a646_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l667_c15_236d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l667_c15_236d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l667_c15_236d_left;
     BIN_OP_EQ_uxn_opcodes_h_l667_c15_236d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l667_c15_236d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l667_c15_236d_return_output := BIN_OP_EQ_uxn_opcodes_h_l667_c15_236d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l651_c11_6e2e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l651_c11_6e2e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l651_c11_6e2e_left;
     BIN_OP_EQ_uxn_opcodes_h_l651_c11_6e2e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l651_c11_6e2e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l651_c11_6e2e_return_output := BIN_OP_EQ_uxn_opcodes_h_l651_c11_6e2e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l648_c11_4e42] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l648_c11_4e42_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l648_c11_4e42_left;
     BIN_OP_EQ_uxn_opcodes_h_l648_c11_4e42_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l648_c11_4e42_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l648_c11_4e42_return_output := BIN_OP_EQ_uxn_opcodes_h_l648_c11_4e42_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l655_l651_l640_l669_l643_l658_l648_l664_DUPLICATE_8065 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l655_l651_l640_l669_l643_l658_l648_l664_DUPLICATE_8065_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l655_l651_l640_l634_l643_l648_l664_DUPLICATE_6f53 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l655_l651_l640_l634_l643_l648_l664_DUPLICATE_6f53_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l634_c6_e514] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l634_c6_e514_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l634_c6_e514_left;
     BIN_OP_EQ_uxn_opcodes_h_l634_c6_e514_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l634_c6_e514_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l634_c6_e514_return_output := BIN_OP_EQ_uxn_opcodes_h_l634_c6_e514_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l666_c26_9a59] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l666_c26_9a59_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l666_c26_9a59_left;
     BIN_OP_EQ_uxn_opcodes_h_l666_c26_9a59_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l666_c26_9a59_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l666_c26_9a59_return_output := BIN_OP_EQ_uxn_opcodes_h_l666_c26_9a59_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l655_c7_1e94] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l655_c7_1e94_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l652_l644_DUPLICATE_4ca1 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l652_l644_DUPLICATE_4ca1_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l655_l651_l640_l634_l643_l658_l648_l664_DUPLICATE_2616 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l655_l651_l640_l634_l643_l658_l648_l664_DUPLICATE_2616_return_output := result.pc;

     -- BIN_OP_EQ[uxn_opcodes_h_l643_c11_bf53] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l643_c11_bf53_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_bf53_left;
     BIN_OP_EQ_uxn_opcodes_h_l643_c11_bf53_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_bf53_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_bf53_return_output := BIN_OP_EQ_uxn_opcodes_h_l643_c11_bf53_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l662_c32_17cd] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l662_c32_17cd_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l662_c32_17cd_left;
     BIN_OP_AND_uxn_opcodes_h_l662_c32_17cd_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l662_c32_17cd_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l662_c32_17cd_return_output := BIN_OP_AND_uxn_opcodes_h_l662_c32_17cd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l658_c11_27fa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l658_c11_27fa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c11_27fa_left;
     BIN_OP_EQ_uxn_opcodes_h_l658_c11_27fa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c11_27fa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c11_27fa_return_output := BIN_OP_EQ_uxn_opcodes_h_l658_c11_27fa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l640_c11_8842] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l640_c11_8842_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c11_8842_left;
     BIN_OP_EQ_uxn_opcodes_h_l640_c11_8842_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c11_8842_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c11_8842_return_output := BIN_OP_EQ_uxn_opcodes_h_l640_c11_8842_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l669_c11_6a0d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l669_c11_6a0d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_6a0d_left;
     BIN_OP_EQ_uxn_opcodes_h_l669_c11_6a0d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_6a0d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_6a0d_return_output := BIN_OP_EQ_uxn_opcodes_h_l669_c11_6a0d_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l655_l651_l640_l634_l643_l658_l648_DUPLICATE_06e9 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l655_l651_l640_l634_l643_l658_l648_DUPLICATE_06e9_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l655_l651_l640_l634_l669_l643_l658_l648_DUPLICATE_8433 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l655_l651_l640_l634_l669_l643_l658_l648_DUPLICATE_8433_return_output := result.is_pc_updated;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l662_c32_40e6_left := VAR_BIN_OP_AND_uxn_opcodes_h_l662_c32_17cd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l634_c1_893c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l634_c6_e514_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l634_c2_3150_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l634_c6_e514_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l634_c2_3150_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l634_c6_e514_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l634_c2_3150_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l634_c6_e514_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l634_c2_3150_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l634_c6_e514_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l634_c2_3150_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l634_c6_e514_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l634_c2_3150_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l634_c6_e514_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l634_c2_3150_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l634_c6_e514_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l634_c2_3150_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l634_c6_e514_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l634_c2_3150_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l634_c6_e514_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l640_c7_fe34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c11_8842_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_fe34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c11_8842_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_fe34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c11_8842_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l640_c7_fe34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c11_8842_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l640_c7_fe34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c11_8842_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l640_c7_fe34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c11_8842_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_fe34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c11_8842_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c7_fe34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c11_8842_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l640_c7_fe34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c11_8842_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l643_c7_3702_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_bf53_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_3702_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_bf53_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_3702_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_bf53_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_3702_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_bf53_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l643_c7_3702_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_bf53_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l643_c7_3702_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_bf53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_3702_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_bf53_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l643_c7_3702_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_bf53_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l643_c7_3702_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_bf53_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l648_c7_1d6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l648_c11_4e42_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l648_c7_1d6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l648_c11_4e42_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l648_c7_1d6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l648_c11_4e42_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l648_c7_1d6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l648_c11_4e42_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l648_c7_1d6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l648_c11_4e42_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l648_c7_1d6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l648_c11_4e42_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l648_c7_1d6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l648_c11_4e42_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l648_c7_1d6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l648_c11_4e42_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l648_c7_1d6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l648_c11_4e42_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l651_c7_47d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l651_c11_6e2e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l651_c7_47d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l651_c11_6e2e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l651_c7_47d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l651_c11_6e2e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l651_c7_47d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l651_c11_6e2e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l651_c7_47d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l651_c11_6e2e_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l651_c7_47d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l651_c11_6e2e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l651_c7_47d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l651_c11_6e2e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l651_c7_47d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l651_c11_6e2e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l651_c7_47d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l651_c11_6e2e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l655_c7_1e94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_a646_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_1e94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_a646_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_1e94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_a646_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_1e94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_a646_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_1e94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_a646_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l655_c7_1e94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_a646_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_1e94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_a646_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_1e94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_a646_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l658_c7_4f78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c11_27fa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_4f78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c11_27fa_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c7_4f78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c11_27fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l658_c7_4f78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c11_27fa_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l658_c7_4f78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c11_27fa_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l658_c7_4f78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c11_27fa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c7_4f78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l658_c11_27fa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l664_c7_3d85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l664_c11_4b43_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l664_c7_3d85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l664_c11_4b43_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l664_c7_3d85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l664_c11_4b43_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l664_c7_3d85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l664_c11_4b43_return_output;
     VAR_MUX_uxn_opcodes_h_l666_c26_35da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l666_c26_9a59_return_output;
     VAR_MUX_uxn_opcodes_h_l667_c15_c1a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l667_c15_236d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_175d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_6a0d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l669_c7_175d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_6a0d_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l652_c3_a9c7_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l652_l644_DUPLICATE_4ca1_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l645_c3_b64c_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l652_l644_DUPLICATE_4ca1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l634_c2_3150_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l655_l651_l640_l634_l643_l658_l648_DUPLICATE_06e9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_fe34_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l655_l651_l640_l634_l643_l658_l648_DUPLICATE_06e9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_3702_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l655_l651_l640_l634_l643_l658_l648_DUPLICATE_06e9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l648_c7_1d6a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l655_l651_l640_l634_l643_l658_l648_DUPLICATE_06e9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l651_c7_47d2_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l655_l651_l640_l634_l643_l658_l648_DUPLICATE_06e9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_1e94_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l655_l651_l640_l634_l643_l658_l648_DUPLICATE_06e9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c7_4f78_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l655_l651_l640_l634_l643_l658_l648_DUPLICATE_06e9_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l634_c2_3150_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l655_l651_l640_l634_l643_l658_l648_l664_DUPLICATE_2616_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l640_c7_fe34_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l655_l651_l640_l634_l643_l658_l648_l664_DUPLICATE_2616_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l643_c7_3702_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l655_l651_l640_l634_l643_l658_l648_l664_DUPLICATE_2616_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l648_c7_1d6a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l655_l651_l640_l634_l643_l658_l648_l664_DUPLICATE_2616_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l651_c7_47d2_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l655_l651_l640_l634_l643_l658_l648_l664_DUPLICATE_2616_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l655_c7_1e94_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l655_l651_l640_l634_l643_l658_l648_l664_DUPLICATE_2616_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l658_c7_4f78_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l655_l651_l640_l634_l643_l658_l648_l664_DUPLICATE_2616_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l664_c7_3d85_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l655_l651_l640_l634_l643_l658_l648_l664_DUPLICATE_2616_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_fe34_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l655_l651_l640_l669_l643_l658_l648_l664_DUPLICATE_8065_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_3702_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l655_l651_l640_l669_l643_l658_l648_l664_DUPLICATE_8065_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l648_c7_1d6a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l655_l651_l640_l669_l643_l658_l648_l664_DUPLICATE_8065_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l651_c7_47d2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l655_l651_l640_l669_l643_l658_l648_l664_DUPLICATE_8065_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_1e94_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l655_l651_l640_l669_l643_l658_l648_l664_DUPLICATE_8065_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_4f78_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l655_l651_l640_l669_l643_l658_l648_l664_DUPLICATE_8065_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l664_c7_3d85_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l655_l651_l640_l669_l643_l658_l648_l664_DUPLICATE_8065_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_175d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l655_l651_l640_l669_l643_l658_l648_l664_DUPLICATE_8065_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l634_c2_3150_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l655_l651_l640_l634_l669_l643_l658_l648_DUPLICATE_8433_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_fe34_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l655_l651_l640_l634_l669_l643_l658_l648_DUPLICATE_8433_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_3702_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l655_l651_l640_l634_l669_l643_l658_l648_DUPLICATE_8433_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l648_c7_1d6a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l655_l651_l640_l634_l669_l643_l658_l648_DUPLICATE_8433_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l651_c7_47d2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l655_l651_l640_l634_l669_l643_l658_l648_DUPLICATE_8433_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_1e94_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l655_l651_l640_l634_l669_l643_l658_l648_DUPLICATE_8433_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c7_4f78_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l655_l651_l640_l634_l669_l643_l658_l648_DUPLICATE_8433_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l669_c7_175d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l655_l651_l640_l634_l669_l643_l658_l648_DUPLICATE_8433_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l634_c2_3150_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l655_l651_l640_l634_l643_l648_l664_DUPLICATE_6f53_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l640_c7_fe34_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l655_l651_l640_l634_l643_l648_l664_DUPLICATE_6f53_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_3702_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l655_l651_l640_l634_l643_l648_l664_DUPLICATE_6f53_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l648_c7_1d6a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l655_l651_l640_l634_l643_l648_l664_DUPLICATE_6f53_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l651_c7_47d2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l655_l651_l640_l634_l643_l648_l664_DUPLICATE_6f53_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_1e94_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l655_l651_l640_l634_l643_l648_l664_DUPLICATE_6f53_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l664_c7_3d85_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l655_l651_l640_l634_l643_l648_l664_DUPLICATE_6f53_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l640_c7_fe34_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l655_l651_l640_l643_l658_l648_DUPLICATE_16e1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l643_c7_3702_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l655_l651_l640_l643_l658_l648_DUPLICATE_16e1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l648_c7_1d6a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l655_l651_l640_l643_l658_l648_DUPLICATE_16e1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l651_c7_47d2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l655_l651_l640_l643_l658_l648_DUPLICATE_16e1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_1e94_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l655_l651_l640_l643_l658_l648_DUPLICATE_16e1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l658_c7_4f78_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l655_l651_l640_l643_l658_l648_DUPLICATE_16e1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_1e94_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l655_c7_1e94_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l658_c7_4f78] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l658_c7_4f78_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l658_c7_4f78_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l658_c7_4f78_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l658_c7_4f78_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l658_c7_4f78_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l658_c7_4f78_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l658_c7_4f78_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l658_c7_4f78_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l669_c7_175d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_175d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_175d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_175d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_175d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_175d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_175d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_175d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_175d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l655_c7_1e94] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_1e94_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_1e94_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_1e94_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_1e94_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_1e94_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_1e94_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_1e94_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_1e94_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l669_c7_175d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l669_c7_175d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l669_c7_175d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l669_c7_175d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l669_c7_175d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l669_c7_175d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l669_c7_175d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l669_c7_175d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l669_c7_175d_return_output;

     -- n8_MUX[uxn_opcodes_h_l658_c7_4f78] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l658_c7_4f78_cond <= VAR_n8_MUX_uxn_opcodes_h_l658_c7_4f78_cond;
     n8_MUX_uxn_opcodes_h_l658_c7_4f78_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l658_c7_4f78_iftrue;
     n8_MUX_uxn_opcodes_h_l658_c7_4f78_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l658_c7_4f78_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l658_c7_4f78_return_output := n8_MUX_uxn_opcodes_h_l658_c7_4f78_return_output;

     -- MUX[uxn_opcodes_h_l666_c26_35da] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l666_c26_35da_cond <= VAR_MUX_uxn_opcodes_h_l666_c26_35da_cond;
     MUX_uxn_opcodes_h_l666_c26_35da_iftrue <= VAR_MUX_uxn_opcodes_h_l666_c26_35da_iftrue;
     MUX_uxn_opcodes_h_l666_c26_35da_iffalse <= VAR_MUX_uxn_opcodes_h_l666_c26_35da_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l666_c26_35da_return_output := MUX_uxn_opcodes_h_l666_c26_35da_return_output;

     -- MUX[uxn_opcodes_h_l667_c15_c1a2] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l667_c15_c1a2_cond <= VAR_MUX_uxn_opcodes_h_l667_c15_c1a2_cond;
     MUX_uxn_opcodes_h_l667_c15_c1a2_iftrue <= VAR_MUX_uxn_opcodes_h_l667_c15_c1a2_iftrue;
     MUX_uxn_opcodes_h_l667_c15_c1a2_iffalse <= VAR_MUX_uxn_opcodes_h_l667_c15_c1a2_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l667_c15_c1a2_return_output := MUX_uxn_opcodes_h_l667_c15_c1a2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l664_c7_3d85] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l664_c7_3d85_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l664_c7_3d85_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l664_c7_3d85_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l664_c7_3d85_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l664_c7_3d85_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l664_c7_3d85_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l664_c7_3d85_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l664_c7_3d85_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l645_c3_b64c] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l645_c3_b64c_x <= VAR_CONST_SL_8_uxn_opcodes_h_l645_c3_b64c_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l645_c3_b64c_return_output := CONST_SL_8_uxn_opcodes_h_l645_c3_b64c_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l662_c32_40e6] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l662_c32_40e6_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l662_c32_40e6_left;
     BIN_OP_GT_uxn_opcodes_h_l662_c32_40e6_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l662_c32_40e6_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l662_c32_40e6_return_output := BIN_OP_GT_uxn_opcodes_h_l662_c32_40e6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l634_c1_893c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l634_c1_893c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l634_c1_893c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l634_c1_893c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l634_c1_893c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l634_c1_893c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l634_c1_893c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l634_c1_893c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l634_c1_893c_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l652_c3_a9c7] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l652_c3_a9c7_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l652_c3_a9c7_left;
     BIN_OP_OR_uxn_opcodes_h_l652_c3_a9c7_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l652_c3_a9c7_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l652_c3_a9c7_return_output := BIN_OP_OR_uxn_opcodes_h_l652_c3_a9c7_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l662_c32_e9f4_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l662_c32_40e6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l651_c7_47d2_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l652_c3_a9c7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l643_c7_3702_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l645_c3_b64c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l664_c7_3d85_iftrue := VAR_MUX_uxn_opcodes_h_l666_c26_35da_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l664_c7_3d85_iftrue := VAR_MUX_uxn_opcodes_h_l667_c15_c1a2_return_output;
     VAR_printf_uxn_opcodes_h_l635_c3_23f7_uxn_opcodes_h_l635_c3_23f7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l634_c1_893c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l655_c7_1e94_iffalse := VAR_n8_MUX_uxn_opcodes_h_l658_c7_4f78_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l664_c7_3d85_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_175d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l664_c7_3d85_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l669_c7_175d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l658_c7_4f78_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l664_c7_3d85_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_1e94_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l658_c7_4f78_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l651_c7_47d2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_1e94_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l664_c7_3d85] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l664_c7_3d85_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l664_c7_3d85_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l664_c7_3d85_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l664_c7_3d85_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l664_c7_3d85_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l664_c7_3d85_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l664_c7_3d85_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l664_c7_3d85_return_output;

     -- t16_MUX[uxn_opcodes_h_l651_c7_47d2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l651_c7_47d2_cond <= VAR_t16_MUX_uxn_opcodes_h_l651_c7_47d2_cond;
     t16_MUX_uxn_opcodes_h_l651_c7_47d2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l651_c7_47d2_iftrue;
     t16_MUX_uxn_opcodes_h_l651_c7_47d2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l651_c7_47d2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l651_c7_47d2_return_output := t16_MUX_uxn_opcodes_h_l651_c7_47d2_return_output;

     -- n8_MUX[uxn_opcodes_h_l655_c7_1e94] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l655_c7_1e94_cond <= VAR_n8_MUX_uxn_opcodes_h_l655_c7_1e94_cond;
     n8_MUX_uxn_opcodes_h_l655_c7_1e94_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l655_c7_1e94_iftrue;
     n8_MUX_uxn_opcodes_h_l655_c7_1e94_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l655_c7_1e94_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l655_c7_1e94_return_output := n8_MUX_uxn_opcodes_h_l655_c7_1e94_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l658_c7_4f78] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l658_c7_4f78_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l658_c7_4f78_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l658_c7_4f78_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l658_c7_4f78_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l658_c7_4f78_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l658_c7_4f78_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l658_c7_4f78_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l658_c7_4f78_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l651_c7_47d2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l651_c7_47d2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l651_c7_47d2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l651_c7_47d2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l651_c7_47d2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l651_c7_47d2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l651_c7_47d2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l651_c7_47d2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l651_c7_47d2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l664_c7_3d85] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l664_c7_3d85_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l664_c7_3d85_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l664_c7_3d85_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l664_c7_3d85_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l664_c7_3d85_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l664_c7_3d85_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l664_c7_3d85_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l664_c7_3d85_return_output;

     -- printf_uxn_opcodes_h_l635_c3_23f7[uxn_opcodes_h_l635_c3_23f7] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l635_c3_23f7_uxn_opcodes_h_l635_c3_23f7_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l635_c3_23f7_uxn_opcodes_h_l635_c3_23f7_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_read_MUX[uxn_opcodes_h_l655_c7_1e94] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_1e94_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_1e94_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_1e94_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_1e94_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_1e94_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_1e94_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_1e94_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_1e94_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l664_c7_3d85] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l664_c7_3d85_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l664_c7_3d85_cond;
     result_pc_MUX_uxn_opcodes_h_l664_c7_3d85_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l664_c7_3d85_iftrue;
     result_pc_MUX_uxn_opcodes_h_l664_c7_3d85_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l664_c7_3d85_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l664_c7_3d85_return_output := result_pc_MUX_uxn_opcodes_h_l664_c7_3d85_return_output;

     -- MUX[uxn_opcodes_h_l662_c32_e9f4] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l662_c32_e9f4_cond <= VAR_MUX_uxn_opcodes_h_l662_c32_e9f4_cond;
     MUX_uxn_opcodes_h_l662_c32_e9f4_iftrue <= VAR_MUX_uxn_opcodes_h_l662_c32_e9f4_iftrue;
     MUX_uxn_opcodes_h_l662_c32_e9f4_iffalse <= VAR_MUX_uxn_opcodes_h_l662_c32_e9f4_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l662_c32_e9f4_return_output := MUX_uxn_opcodes_h_l662_c32_e9f4_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c7_4f78_iftrue := VAR_MUX_uxn_opcodes_h_l662_c32_e9f4_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l651_c7_47d2_iffalse := VAR_n8_MUX_uxn_opcodes_h_l655_c7_1e94_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_4f78_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l664_c7_3d85_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c7_4f78_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l664_c7_3d85_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_1e94_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l658_c7_4f78_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l651_c7_47d2_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_1e94_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l658_c7_4f78_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l664_c7_3d85_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l648_c7_1d6a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l651_c7_47d2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l648_c7_1d6a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l651_c7_47d2_return_output;
     -- n8_MUX[uxn_opcodes_h_l651_c7_47d2] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l651_c7_47d2_cond <= VAR_n8_MUX_uxn_opcodes_h_l651_c7_47d2_cond;
     n8_MUX_uxn_opcodes_h_l651_c7_47d2_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l651_c7_47d2_iftrue;
     n8_MUX_uxn_opcodes_h_l651_c7_47d2_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l651_c7_47d2_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l651_c7_47d2_return_output := n8_MUX_uxn_opcodes_h_l651_c7_47d2_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l651_c7_47d2] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l651_c7_47d2_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l651_c7_47d2_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l651_c7_47d2_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l651_c7_47d2_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l651_c7_47d2_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l651_c7_47d2_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l651_c7_47d2_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l651_c7_47d2_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l658_c7_4f78] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l658_c7_4f78_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c7_4f78_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l658_c7_4f78_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c7_4f78_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l658_c7_4f78_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c7_4f78_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c7_4f78_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l658_c7_4f78_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l658_c7_4f78] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c7_4f78_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c7_4f78_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c7_4f78_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c7_4f78_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c7_4f78_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c7_4f78_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c7_4f78_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c7_4f78_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l648_c7_1d6a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l648_c7_1d6a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l648_c7_1d6a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l648_c7_1d6a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l648_c7_1d6a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l648_c7_1d6a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l648_c7_1d6a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l655_c7_1e94] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_1e94_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_1e94_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_1e94_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_1e94_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_1e94_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_1e94_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_1e94_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_1e94_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l658_c7_4f78] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l658_c7_4f78_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l658_c7_4f78_cond;
     result_pc_MUX_uxn_opcodes_h_l658_c7_4f78_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l658_c7_4f78_iftrue;
     result_pc_MUX_uxn_opcodes_h_l658_c7_4f78_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l658_c7_4f78_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l658_c7_4f78_return_output := result_pc_MUX_uxn_opcodes_h_l658_c7_4f78_return_output;

     -- t16_MUX[uxn_opcodes_h_l648_c7_1d6a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l648_c7_1d6a_cond <= VAR_t16_MUX_uxn_opcodes_h_l648_c7_1d6a_cond;
     t16_MUX_uxn_opcodes_h_l648_c7_1d6a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l648_c7_1d6a_iftrue;
     t16_MUX_uxn_opcodes_h_l648_c7_1d6a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l648_c7_1d6a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output := t16_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l658_c7_4f78] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_4f78_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_4f78_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_4f78_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_4f78_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_4f78_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_4f78_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_4f78_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_4f78_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l648_c7_1d6a_iffalse := VAR_n8_MUX_uxn_opcodes_h_l651_c7_47d2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_1e94_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l658_c7_4f78_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_1e94_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l658_c7_4f78_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l651_c7_47d2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_1e94_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l648_c7_1d6a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l651_c7_47d2_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l655_c7_1e94_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l658_c7_4f78_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_1e94_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l658_c7_4f78_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l643_c7_3702_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l643_c7_3702_iffalse := VAR_t16_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l651_c7_47d2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l651_c7_47d2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l651_c7_47d2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l651_c7_47d2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l651_c7_47d2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l651_c7_47d2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l651_c7_47d2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l651_c7_47d2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l651_c7_47d2_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l655_c7_1e94] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l655_c7_1e94_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l655_c7_1e94_cond;
     result_pc_MUX_uxn_opcodes_h_l655_c7_1e94_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l655_c7_1e94_iftrue;
     result_pc_MUX_uxn_opcodes_h_l655_c7_1e94_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l655_c7_1e94_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l655_c7_1e94_return_output := result_pc_MUX_uxn_opcodes_h_l655_c7_1e94_return_output;

     -- n8_MUX[uxn_opcodes_h_l648_c7_1d6a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l648_c7_1d6a_cond <= VAR_n8_MUX_uxn_opcodes_h_l648_c7_1d6a_cond;
     n8_MUX_uxn_opcodes_h_l648_c7_1d6a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l648_c7_1d6a_iftrue;
     n8_MUX_uxn_opcodes_h_l648_c7_1d6a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l648_c7_1d6a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output := n8_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l643_c7_3702] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l643_c7_3702_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l643_c7_3702_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l643_c7_3702_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l643_c7_3702_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l643_c7_3702_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l643_c7_3702_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l643_c7_3702_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l643_c7_3702_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l655_c7_1e94] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_1e94_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_1e94_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_1e94_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_1e94_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_1e94_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_1e94_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_1e94_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_1e94_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l648_c7_1d6a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l648_c7_1d6a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l648_c7_1d6a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l648_c7_1d6a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l648_c7_1d6a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l648_c7_1d6a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l648_c7_1d6a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l655_c7_1e94] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_1e94_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_1e94_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_1e94_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_1e94_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_1e94_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_1e94_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_1e94_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_1e94_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l655_c7_1e94] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_1e94_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_1e94_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_1e94_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_1e94_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_1e94_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_1e94_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_1e94_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_1e94_return_output;

     -- t16_MUX[uxn_opcodes_h_l643_c7_3702] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l643_c7_3702_cond <= VAR_t16_MUX_uxn_opcodes_h_l643_c7_3702_cond;
     t16_MUX_uxn_opcodes_h_l643_c7_3702_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l643_c7_3702_iftrue;
     t16_MUX_uxn_opcodes_h_l643_c7_3702_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l643_c7_3702_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l643_c7_3702_return_output := t16_MUX_uxn_opcodes_h_l643_c7_3702_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l643_c7_3702_iffalse := VAR_n8_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l651_c7_47d2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_1e94_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l651_c7_47d2_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l655_c7_1e94_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l648_c7_1d6a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l651_c7_47d2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l643_c7_3702_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l651_c7_47d2_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l655_c7_1e94_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l651_c7_47d2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_1e94_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c7_fe34_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l643_c7_3702_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l640_c7_fe34_iffalse := VAR_t16_MUX_uxn_opcodes_h_l643_c7_3702_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l651_c7_47d2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l651_c7_47d2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l651_c7_47d2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l651_c7_47d2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l651_c7_47d2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l651_c7_47d2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l651_c7_47d2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l651_c7_47d2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l651_c7_47d2_return_output;

     -- t16_MUX[uxn_opcodes_h_l640_c7_fe34] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l640_c7_fe34_cond <= VAR_t16_MUX_uxn_opcodes_h_l640_c7_fe34_cond;
     t16_MUX_uxn_opcodes_h_l640_c7_fe34_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l640_c7_fe34_iftrue;
     t16_MUX_uxn_opcodes_h_l640_c7_fe34_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l640_c7_fe34_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l640_c7_fe34_return_output := t16_MUX_uxn_opcodes_h_l640_c7_fe34_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l651_c7_47d2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l651_c7_47d2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l651_c7_47d2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l651_c7_47d2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l651_c7_47d2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l651_c7_47d2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l651_c7_47d2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l651_c7_47d2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l651_c7_47d2_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l651_c7_47d2] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l651_c7_47d2_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l651_c7_47d2_cond;
     result_pc_MUX_uxn_opcodes_h_l651_c7_47d2_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l651_c7_47d2_iftrue;
     result_pc_MUX_uxn_opcodes_h_l651_c7_47d2_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l651_c7_47d2_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l651_c7_47d2_return_output := result_pc_MUX_uxn_opcodes_h_l651_c7_47d2_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l651_c7_47d2] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l651_c7_47d2_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l651_c7_47d2_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l651_c7_47d2_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l651_c7_47d2_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l651_c7_47d2_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l651_c7_47d2_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l651_c7_47d2_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l651_c7_47d2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l648_c7_1d6a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l648_c7_1d6a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l648_c7_1d6a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l648_c7_1d6a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l648_c7_1d6a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l648_c7_1d6a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l648_c7_1d6a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output;

     -- n8_MUX[uxn_opcodes_h_l643_c7_3702] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l643_c7_3702_cond <= VAR_n8_MUX_uxn_opcodes_h_l643_c7_3702_cond;
     n8_MUX_uxn_opcodes_h_l643_c7_3702_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l643_c7_3702_iftrue;
     n8_MUX_uxn_opcodes_h_l643_c7_3702_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l643_c7_3702_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l643_c7_3702_return_output := n8_MUX_uxn_opcodes_h_l643_c7_3702_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l643_c7_3702] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l643_c7_3702_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l643_c7_3702_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l643_c7_3702_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l643_c7_3702_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l643_c7_3702_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l643_c7_3702_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l643_c7_3702_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l643_c7_3702_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l640_c7_fe34] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c7_fe34_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c7_fe34_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c7_fe34_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c7_fe34_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c7_fe34_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c7_fe34_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c7_fe34_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c7_fe34_return_output;

     -- Submodule level 6
     VAR_n8_MUX_uxn_opcodes_h_l640_c7_fe34_iffalse := VAR_n8_MUX_uxn_opcodes_h_l643_c7_3702_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l648_c7_1d6a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l651_c7_47d2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l648_c7_1d6a_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l651_c7_47d2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_3702_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l640_c7_fe34_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l643_c7_3702_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l648_c7_1d6a_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l651_c7_47d2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l648_c7_1d6a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l651_c7_47d2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l634_c2_3150_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l640_c7_fe34_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l634_c2_3150_iffalse := VAR_t16_MUX_uxn_opcodes_h_l640_c7_fe34_return_output;
     -- t16_MUX[uxn_opcodes_h_l634_c2_3150] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l634_c2_3150_cond <= VAR_t16_MUX_uxn_opcodes_h_l634_c2_3150_cond;
     t16_MUX_uxn_opcodes_h_l634_c2_3150_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l634_c2_3150_iftrue;
     t16_MUX_uxn_opcodes_h_l634_c2_3150_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l634_c2_3150_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l634_c2_3150_return_output := t16_MUX_uxn_opcodes_h_l634_c2_3150_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l648_c7_1d6a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l648_c7_1d6a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l648_c7_1d6a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l648_c7_1d6a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l648_c7_1d6a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l648_c7_1d6a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l648_c7_1d6a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l643_c7_3702] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_3702_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_3702_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_3702_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_3702_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_3702_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_3702_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_3702_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_3702_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l648_c7_1d6a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l648_c7_1d6a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l648_c7_1d6a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l648_c7_1d6a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l648_c7_1d6a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l648_c7_1d6a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l648_c7_1d6a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l648_c7_1d6a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l648_c7_1d6a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l648_c7_1d6a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l648_c7_1d6a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l648_c7_1d6a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l648_c7_1d6a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l648_c7_1d6a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output;

     -- n8_MUX[uxn_opcodes_h_l640_c7_fe34] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l640_c7_fe34_cond <= VAR_n8_MUX_uxn_opcodes_h_l640_c7_fe34_cond;
     n8_MUX_uxn_opcodes_h_l640_c7_fe34_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l640_c7_fe34_iftrue;
     n8_MUX_uxn_opcodes_h_l640_c7_fe34_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l640_c7_fe34_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l640_c7_fe34_return_output := n8_MUX_uxn_opcodes_h_l640_c7_fe34_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l648_c7_1d6a] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l648_c7_1d6a_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l648_c7_1d6a_cond;
     result_pc_MUX_uxn_opcodes_h_l648_c7_1d6a_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l648_c7_1d6a_iftrue;
     result_pc_MUX_uxn_opcodes_h_l648_c7_1d6a_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l648_c7_1d6a_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output := result_pc_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l634_c2_3150] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l634_c2_3150_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l634_c2_3150_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l634_c2_3150_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l634_c2_3150_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l634_c2_3150_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l634_c2_3150_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l634_c2_3150_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l634_c2_3150_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l640_c7_fe34] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l640_c7_fe34_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l640_c7_fe34_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l640_c7_fe34_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l640_c7_fe34_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l640_c7_fe34_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l640_c7_fe34_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l640_c7_fe34_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l640_c7_fe34_return_output;

     -- Submodule level 7
     VAR_n8_MUX_uxn_opcodes_h_l634_c2_3150_iffalse := VAR_n8_MUX_uxn_opcodes_h_l640_c7_fe34_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_3702_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_3702_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l640_c7_fe34_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_3702_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l634_c2_3150_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l640_c7_fe34_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l643_c7_3702_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_3702_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l648_c7_1d6a_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l634_c2_3150_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l643_c7_3702] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_3702_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_3702_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_3702_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_3702_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_3702_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_3702_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_3702_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_3702_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l634_c2_3150] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l634_c2_3150_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l634_c2_3150_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l634_c2_3150_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l634_c2_3150_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l634_c2_3150_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l634_c2_3150_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l634_c2_3150_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l634_c2_3150_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l643_c7_3702] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l643_c7_3702_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l643_c7_3702_cond;
     result_pc_MUX_uxn_opcodes_h_l643_c7_3702_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l643_c7_3702_iftrue;
     result_pc_MUX_uxn_opcodes_h_l643_c7_3702_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l643_c7_3702_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l643_c7_3702_return_output := result_pc_MUX_uxn_opcodes_h_l643_c7_3702_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l640_c7_fe34] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l640_c7_fe34_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l640_c7_fe34_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l640_c7_fe34_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l640_c7_fe34_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l640_c7_fe34_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l640_c7_fe34_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l640_c7_fe34_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l640_c7_fe34_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l643_c7_3702] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_3702_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_3702_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_3702_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_3702_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_3702_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_3702_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_3702_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_3702_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l643_c7_3702] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_3702_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_3702_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_3702_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_3702_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_3702_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_3702_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_3702_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_3702_return_output;

     -- n8_MUX[uxn_opcodes_h_l634_c2_3150] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l634_c2_3150_cond <= VAR_n8_MUX_uxn_opcodes_h_l634_c2_3150_cond;
     n8_MUX_uxn_opcodes_h_l634_c2_3150_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l634_c2_3150_iftrue;
     n8_MUX_uxn_opcodes_h_l634_c2_3150_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l634_c2_3150_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l634_c2_3150_return_output := n8_MUX_uxn_opcodes_h_l634_c2_3150_return_output;

     -- Submodule level 8
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l634_c2_3150_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_fe34_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_3702_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_fe34_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_3702_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l634_c2_3150_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l640_c7_fe34_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l640_c7_fe34_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l643_c7_3702_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_fe34_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l643_c7_3702_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l640_c7_fe34] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_fe34_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_fe34_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_fe34_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_fe34_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_fe34_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_fe34_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_fe34_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_fe34_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l640_c7_fe34] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_fe34_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_fe34_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_fe34_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_fe34_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_fe34_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_fe34_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_fe34_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_fe34_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l634_c2_3150] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l634_c2_3150_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l634_c2_3150_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l634_c2_3150_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l634_c2_3150_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l634_c2_3150_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l634_c2_3150_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l634_c2_3150_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l634_c2_3150_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l640_c7_fe34] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l640_c7_fe34_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l640_c7_fe34_cond;
     result_pc_MUX_uxn_opcodes_h_l640_c7_fe34_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l640_c7_fe34_iftrue;
     result_pc_MUX_uxn_opcodes_h_l640_c7_fe34_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l640_c7_fe34_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l640_c7_fe34_return_output := result_pc_MUX_uxn_opcodes_h_l640_c7_fe34_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l640_c7_fe34] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_fe34_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_fe34_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_fe34_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_fe34_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_fe34_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_fe34_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_fe34_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_fe34_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l634_c2_3150_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_fe34_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l634_c2_3150_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_fe34_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l634_c2_3150_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l640_c7_fe34_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l634_c2_3150_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_fe34_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l634_c2_3150] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l634_c2_3150_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l634_c2_3150_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l634_c2_3150_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l634_c2_3150_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l634_c2_3150_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l634_c2_3150_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l634_c2_3150_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l634_c2_3150_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l634_c2_3150] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l634_c2_3150_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l634_c2_3150_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l634_c2_3150_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l634_c2_3150_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l634_c2_3150_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l634_c2_3150_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l634_c2_3150_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l634_c2_3150_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l634_c2_3150] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l634_c2_3150_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l634_c2_3150_cond;
     result_pc_MUX_uxn_opcodes_h_l634_c2_3150_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l634_c2_3150_iftrue;
     result_pc_MUX_uxn_opcodes_h_l634_c2_3150_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l634_c2_3150_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l634_c2_3150_return_output := result_pc_MUX_uxn_opcodes_h_l634_c2_3150_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l634_c2_3150] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l634_c2_3150_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l634_c2_3150_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l634_c2_3150_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l634_c2_3150_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l634_c2_3150_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l634_c2_3150_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l634_c2_3150_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l634_c2_3150_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_babf_uxn_opcodes_h_l674_l629_DUPLICATE_3607 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_babf_uxn_opcodes_h_l674_l629_DUPLICATE_3607_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_babf(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l634_c2_3150_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l634_c2_3150_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l634_c2_3150_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l634_c2_3150_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l634_c2_3150_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l634_c2_3150_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l634_c2_3150_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_babf_uxn_opcodes_h_l674_l629_DUPLICATE_3607_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_babf_uxn_opcodes_h_l674_l629_DUPLICATE_3607_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
