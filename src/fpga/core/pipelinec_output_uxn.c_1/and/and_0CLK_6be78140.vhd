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
-- Submodules: 38
entity and_0CLK_6be78140 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end and_0CLK_6be78140;
architecture arch of and_0CLK_6be78140 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l891_c6_e412]
signal BIN_OP_EQ_uxn_opcodes_h_l891_c6_e412_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l891_c6_e412_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l891_c6_e412_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l891_c2_d475]
signal n8_MUX_uxn_opcodes_h_l891_c2_d475_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l891_c2_d475_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l891_c2_d475_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l891_c2_d475_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l891_c2_d475]
signal result_u8_value_MUX_uxn_opcodes_h_l891_c2_d475_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l891_c2_d475_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l891_c2_d475_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l891_c2_d475_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l891_c2_d475]
signal result_is_stack_write_MUX_uxn_opcodes_h_l891_c2_d475_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l891_c2_d475_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l891_c2_d475_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l891_c2_d475_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l891_c2_d475]
signal result_is_opc_done_MUX_uxn_opcodes_h_l891_c2_d475_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l891_c2_d475_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l891_c2_d475_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l891_c2_d475_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l891_c2_d475]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c2_d475_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c2_d475_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c2_d475_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c2_d475_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l891_c2_d475]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c2_d475_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c2_d475_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c2_d475_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c2_d475_return_output : signed(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l891_c2_d475]
signal t8_MUX_uxn_opcodes_h_l891_c2_d475_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l891_c2_d475_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l891_c2_d475_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l891_c2_d475_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l898_c11_0eca]
signal BIN_OP_EQ_uxn_opcodes_h_l898_c11_0eca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l898_c11_0eca_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l898_c11_0eca_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l898_c7_9d92]
signal n8_MUX_uxn_opcodes_h_l898_c7_9d92_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l898_c7_9d92_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l898_c7_9d92_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l898_c7_9d92_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l898_c7_9d92]
signal result_u8_value_MUX_uxn_opcodes_h_l898_c7_9d92_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l898_c7_9d92_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l898_c7_9d92_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l898_c7_9d92_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l898_c7_9d92]
signal result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9d92_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9d92_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9d92_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9d92_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l898_c7_9d92]
signal result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9d92_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9d92_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9d92_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9d92_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l898_c7_9d92]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9d92_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9d92_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9d92_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9d92_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l898_c7_9d92]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9d92_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9d92_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9d92_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9d92_return_output : signed(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l898_c7_9d92]
signal t8_MUX_uxn_opcodes_h_l898_c7_9d92_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l898_c7_9d92_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l898_c7_9d92_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l898_c7_9d92_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l901_c11_d4b8]
signal BIN_OP_EQ_uxn_opcodes_h_l901_c11_d4b8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l901_c11_d4b8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l901_c11_d4b8_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l901_c7_1223]
signal n8_MUX_uxn_opcodes_h_l901_c7_1223_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l901_c7_1223_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l901_c7_1223_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l901_c7_1223_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l901_c7_1223]
signal result_u8_value_MUX_uxn_opcodes_h_l901_c7_1223_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l901_c7_1223_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l901_c7_1223_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l901_c7_1223_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l901_c7_1223]
signal result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_1223_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_1223_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_1223_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_1223_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l901_c7_1223]
signal result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_1223_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_1223_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_1223_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_1223_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l901_c7_1223]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_1223_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_1223_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_1223_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_1223_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l901_c7_1223]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_1223_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_1223_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_1223_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_1223_return_output : signed(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l901_c7_1223]
signal t8_MUX_uxn_opcodes_h_l901_c7_1223_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l901_c7_1223_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l901_c7_1223_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l901_c7_1223_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l904_c11_201c]
signal BIN_OP_EQ_uxn_opcodes_h_l904_c11_201c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l904_c11_201c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l904_c11_201c_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l904_c7_1985]
signal n8_MUX_uxn_opcodes_h_l904_c7_1985_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l904_c7_1985_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l904_c7_1985_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l904_c7_1985_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l904_c7_1985]
signal result_u8_value_MUX_uxn_opcodes_h_l904_c7_1985_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l904_c7_1985_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l904_c7_1985_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l904_c7_1985_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l904_c7_1985]
signal result_is_stack_write_MUX_uxn_opcodes_h_l904_c7_1985_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l904_c7_1985_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l904_c7_1985_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l904_c7_1985_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l904_c7_1985]
signal result_is_opc_done_MUX_uxn_opcodes_h_l904_c7_1985_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l904_c7_1985_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l904_c7_1985_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l904_c7_1985_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l904_c7_1985]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c7_1985_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c7_1985_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c7_1985_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c7_1985_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l904_c7_1985]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c7_1985_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c7_1985_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c7_1985_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c7_1985_return_output : signed(3 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l907_c30_1fe1]
signal sp_relative_shift_uxn_opcodes_h_l907_c30_1fe1_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l907_c30_1fe1_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l907_c30_1fe1_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l907_c30_1fe1_return_output : signed(3 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l910_c21_dfbe]
signal BIN_OP_AND_uxn_opcodes_h_l910_c21_dfbe_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l910_c21_dfbe_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l910_c21_dfbe_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l912_c11_21ce]
signal BIN_OP_EQ_uxn_opcodes_h_l912_c11_21ce_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l912_c11_21ce_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l912_c11_21ce_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l912_c7_2911]
signal result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_2911_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_2911_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_2911_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_2911_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l912_c7_2911]
signal result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_2911_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_2911_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_2911_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_2911_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l912_c7_2911]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l912_c7_2911_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l912_c7_2911_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l912_c7_2911_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l912_c7_2911_return_output : signed(3 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_eae7( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l891_c6_e412
BIN_OP_EQ_uxn_opcodes_h_l891_c6_e412 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l891_c6_e412_left,
BIN_OP_EQ_uxn_opcodes_h_l891_c6_e412_right,
BIN_OP_EQ_uxn_opcodes_h_l891_c6_e412_return_output);

-- n8_MUX_uxn_opcodes_h_l891_c2_d475
n8_MUX_uxn_opcodes_h_l891_c2_d475 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l891_c2_d475_cond,
n8_MUX_uxn_opcodes_h_l891_c2_d475_iftrue,
n8_MUX_uxn_opcodes_h_l891_c2_d475_iffalse,
n8_MUX_uxn_opcodes_h_l891_c2_d475_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l891_c2_d475
result_u8_value_MUX_uxn_opcodes_h_l891_c2_d475 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l891_c2_d475_cond,
result_u8_value_MUX_uxn_opcodes_h_l891_c2_d475_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l891_c2_d475_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l891_c2_d475_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l891_c2_d475
result_is_stack_write_MUX_uxn_opcodes_h_l891_c2_d475 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l891_c2_d475_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l891_c2_d475_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l891_c2_d475_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l891_c2_d475_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l891_c2_d475
result_is_opc_done_MUX_uxn_opcodes_h_l891_c2_d475 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l891_c2_d475_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l891_c2_d475_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l891_c2_d475_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l891_c2_d475_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c2_d475
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c2_d475 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c2_d475_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c2_d475_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c2_d475_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c2_d475_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c2_d475
result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c2_d475 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c2_d475_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c2_d475_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c2_d475_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c2_d475_return_output);

-- t8_MUX_uxn_opcodes_h_l891_c2_d475
t8_MUX_uxn_opcodes_h_l891_c2_d475 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l891_c2_d475_cond,
t8_MUX_uxn_opcodes_h_l891_c2_d475_iftrue,
t8_MUX_uxn_opcodes_h_l891_c2_d475_iffalse,
t8_MUX_uxn_opcodes_h_l891_c2_d475_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l898_c11_0eca
BIN_OP_EQ_uxn_opcodes_h_l898_c11_0eca : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l898_c11_0eca_left,
BIN_OP_EQ_uxn_opcodes_h_l898_c11_0eca_right,
BIN_OP_EQ_uxn_opcodes_h_l898_c11_0eca_return_output);

-- n8_MUX_uxn_opcodes_h_l898_c7_9d92
n8_MUX_uxn_opcodes_h_l898_c7_9d92 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l898_c7_9d92_cond,
n8_MUX_uxn_opcodes_h_l898_c7_9d92_iftrue,
n8_MUX_uxn_opcodes_h_l898_c7_9d92_iffalse,
n8_MUX_uxn_opcodes_h_l898_c7_9d92_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l898_c7_9d92
result_u8_value_MUX_uxn_opcodes_h_l898_c7_9d92 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l898_c7_9d92_cond,
result_u8_value_MUX_uxn_opcodes_h_l898_c7_9d92_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l898_c7_9d92_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l898_c7_9d92_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9d92
result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9d92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9d92_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9d92_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9d92_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9d92_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9d92
result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9d92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9d92_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9d92_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9d92_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9d92_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9d92
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9d92 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9d92_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9d92_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9d92_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9d92_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9d92
result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9d92 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9d92_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9d92_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9d92_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9d92_return_output);

-- t8_MUX_uxn_opcodes_h_l898_c7_9d92
t8_MUX_uxn_opcodes_h_l898_c7_9d92 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l898_c7_9d92_cond,
t8_MUX_uxn_opcodes_h_l898_c7_9d92_iftrue,
t8_MUX_uxn_opcodes_h_l898_c7_9d92_iffalse,
t8_MUX_uxn_opcodes_h_l898_c7_9d92_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l901_c11_d4b8
BIN_OP_EQ_uxn_opcodes_h_l901_c11_d4b8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l901_c11_d4b8_left,
BIN_OP_EQ_uxn_opcodes_h_l901_c11_d4b8_right,
BIN_OP_EQ_uxn_opcodes_h_l901_c11_d4b8_return_output);

-- n8_MUX_uxn_opcodes_h_l901_c7_1223
n8_MUX_uxn_opcodes_h_l901_c7_1223 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l901_c7_1223_cond,
n8_MUX_uxn_opcodes_h_l901_c7_1223_iftrue,
n8_MUX_uxn_opcodes_h_l901_c7_1223_iffalse,
n8_MUX_uxn_opcodes_h_l901_c7_1223_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l901_c7_1223
result_u8_value_MUX_uxn_opcodes_h_l901_c7_1223 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l901_c7_1223_cond,
result_u8_value_MUX_uxn_opcodes_h_l901_c7_1223_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l901_c7_1223_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l901_c7_1223_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_1223
result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_1223 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_1223_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_1223_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_1223_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_1223_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_1223
result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_1223 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_1223_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_1223_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_1223_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_1223_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_1223
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_1223 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_1223_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_1223_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_1223_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_1223_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_1223
result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_1223 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_1223_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_1223_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_1223_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_1223_return_output);

-- t8_MUX_uxn_opcodes_h_l901_c7_1223
t8_MUX_uxn_opcodes_h_l901_c7_1223 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l901_c7_1223_cond,
t8_MUX_uxn_opcodes_h_l901_c7_1223_iftrue,
t8_MUX_uxn_opcodes_h_l901_c7_1223_iffalse,
t8_MUX_uxn_opcodes_h_l901_c7_1223_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l904_c11_201c
BIN_OP_EQ_uxn_opcodes_h_l904_c11_201c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l904_c11_201c_left,
BIN_OP_EQ_uxn_opcodes_h_l904_c11_201c_right,
BIN_OP_EQ_uxn_opcodes_h_l904_c11_201c_return_output);

-- n8_MUX_uxn_opcodes_h_l904_c7_1985
n8_MUX_uxn_opcodes_h_l904_c7_1985 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l904_c7_1985_cond,
n8_MUX_uxn_opcodes_h_l904_c7_1985_iftrue,
n8_MUX_uxn_opcodes_h_l904_c7_1985_iffalse,
n8_MUX_uxn_opcodes_h_l904_c7_1985_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l904_c7_1985
result_u8_value_MUX_uxn_opcodes_h_l904_c7_1985 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l904_c7_1985_cond,
result_u8_value_MUX_uxn_opcodes_h_l904_c7_1985_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l904_c7_1985_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l904_c7_1985_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l904_c7_1985
result_is_stack_write_MUX_uxn_opcodes_h_l904_c7_1985 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l904_c7_1985_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l904_c7_1985_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l904_c7_1985_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l904_c7_1985_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l904_c7_1985
result_is_opc_done_MUX_uxn_opcodes_h_l904_c7_1985 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l904_c7_1985_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l904_c7_1985_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l904_c7_1985_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l904_c7_1985_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c7_1985
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c7_1985 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c7_1985_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c7_1985_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c7_1985_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c7_1985_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c7_1985
result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c7_1985 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c7_1985_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c7_1985_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c7_1985_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c7_1985_return_output);

-- sp_relative_shift_uxn_opcodes_h_l907_c30_1fe1
sp_relative_shift_uxn_opcodes_h_l907_c30_1fe1 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l907_c30_1fe1_ins,
sp_relative_shift_uxn_opcodes_h_l907_c30_1fe1_x,
sp_relative_shift_uxn_opcodes_h_l907_c30_1fe1_y,
sp_relative_shift_uxn_opcodes_h_l907_c30_1fe1_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l910_c21_dfbe
BIN_OP_AND_uxn_opcodes_h_l910_c21_dfbe : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l910_c21_dfbe_left,
BIN_OP_AND_uxn_opcodes_h_l910_c21_dfbe_right,
BIN_OP_AND_uxn_opcodes_h_l910_c21_dfbe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l912_c11_21ce
BIN_OP_EQ_uxn_opcodes_h_l912_c11_21ce : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l912_c11_21ce_left,
BIN_OP_EQ_uxn_opcodes_h_l912_c11_21ce_right,
BIN_OP_EQ_uxn_opcodes_h_l912_c11_21ce_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_2911
result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_2911 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_2911_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_2911_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_2911_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_2911_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_2911
result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_2911 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_2911_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_2911_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_2911_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_2911_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l912_c7_2911
result_sp_relative_shift_MUX_uxn_opcodes_h_l912_c7_2911 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l912_c7_2911_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l912_c7_2911_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l912_c7_2911_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l912_c7_2911_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l891_c6_e412_return_output,
 n8_MUX_uxn_opcodes_h_l891_c2_d475_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l891_c2_d475_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l891_c2_d475_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l891_c2_d475_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c2_d475_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c2_d475_return_output,
 t8_MUX_uxn_opcodes_h_l891_c2_d475_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l898_c11_0eca_return_output,
 n8_MUX_uxn_opcodes_h_l898_c7_9d92_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l898_c7_9d92_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9d92_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9d92_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9d92_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9d92_return_output,
 t8_MUX_uxn_opcodes_h_l898_c7_9d92_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l901_c11_d4b8_return_output,
 n8_MUX_uxn_opcodes_h_l901_c7_1223_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l901_c7_1223_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_1223_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_1223_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_1223_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_1223_return_output,
 t8_MUX_uxn_opcodes_h_l901_c7_1223_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l904_c11_201c_return_output,
 n8_MUX_uxn_opcodes_h_l904_c7_1985_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l904_c7_1985_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l904_c7_1985_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l904_c7_1985_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c7_1985_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c7_1985_return_output,
 sp_relative_shift_uxn_opcodes_h_l907_c30_1fe1_return_output,
 BIN_OP_AND_uxn_opcodes_h_l910_c21_dfbe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l912_c11_21ce_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_2911_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_2911_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l912_c7_2911_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c6_e412_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c6_e412_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c6_e412_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l891_c2_d475_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l891_c2_d475_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l898_c7_9d92_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l891_c2_d475_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l891_c2_d475_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c2_d475_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c2_d475_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l898_c7_9d92_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c2_d475_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c2_d475_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c2_d475_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c2_d475_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9d92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c2_d475_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c2_d475_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c2_d475_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c2_d475_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9d92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c2_d475_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c2_d475_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c2_d475_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l895_c3_7ec7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c2_d475_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9d92_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c2_d475_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c2_d475_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c2_d475_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c2_d475_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9d92_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c2_d475_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c2_d475_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l891_c2_d475_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l891_c2_d475_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l898_c7_9d92_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l891_c2_d475_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l891_c2_d475_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_0eca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_0eca_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_0eca_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l898_c7_9d92_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l898_c7_9d92_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l901_c7_1223_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l898_c7_9d92_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l898_c7_9d92_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l898_c7_9d92_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l901_c7_1223_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l898_c7_9d92_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9d92_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9d92_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_1223_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9d92_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9d92_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9d92_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_1223_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9d92_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9d92_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l899_c3_0506 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9d92_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_1223_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9d92_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9d92_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9d92_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_1223_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9d92_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l898_c7_9d92_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l898_c7_9d92_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l901_c7_1223_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l898_c7_9d92_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_d4b8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_d4b8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_d4b8_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l901_c7_1223_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l901_c7_1223_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l904_c7_1985_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l901_c7_1223_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l901_c7_1223_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l901_c7_1223_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c7_1985_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l901_c7_1223_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_1223_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_1223_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c7_1985_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_1223_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_1223_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_1223_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c7_1985_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_1223_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_1223_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_1223_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c7_1985_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_1223_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_1223_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_1223_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c7_1985_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_1223_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l901_c7_1223_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l901_c7_1223_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l901_c7_1223_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c11_201c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c11_201c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c11_201c_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l904_c7_1985_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l904_c7_1985_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l904_c7_1985_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c7_1985_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c7_1985_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c7_1985_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c7_1985_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c7_1985_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_2911_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c7_1985_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c7_1985_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c7_1985_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_2911_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c7_1985_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c7_1985_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l909_c3_3cc4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c7_1985_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c7_1985_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c7_1985_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c7_1985_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l912_c7_2911_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c7_1985_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l907_c30_1fe1_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l907_c30_1fe1_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l907_c30_1fe1_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l907_c30_1fe1_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l910_c21_dfbe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l910_c21_dfbe_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l910_c21_dfbe_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l912_c11_21ce_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l912_c11_21ce_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l912_c11_21ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_2911_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_2911_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_2911_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_2911_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_2911_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_2911_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l912_c7_2911_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l913_c3_4f1a : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l912_c7_2911_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l912_c7_2911_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l891_l904_l901_l898_DUPLICATE_d188_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l891_l901_l898_l912_DUPLICATE_319f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l891_l901_l898_l912_DUPLICATE_5c09_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l904_l901_l898_l912_DUPLICATE_a401_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l904_l901_DUPLICATE_45b3_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l887_l918_DUPLICATE_3ace_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_0eca_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l907_c30_1fe1_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c6_e412_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_2911_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l909_c3_3cc4 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c7_1985_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l909_c3_3cc4;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l913_c3_4f1a := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l912_c7_2911_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l913_c3_4f1a;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c2_d475_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_d4b8_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c11_201c_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_2911_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c7_1985_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l907_c30_1fe1_y := resize(to_signed(-1, 2), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l912_c11_21ce_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l895_c3_7ec7 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c2_d475_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l895_c3_7ec7;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l899_c3_0506 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9d92_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l899_c3_0506;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l907_c30_1fe1_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l891_c2_d475_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l898_c7_9d92_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l901_c7_1223_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l904_c7_1985_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c6_e412_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_0eca_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_d4b8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c11_201c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l912_c11_21ce_left := VAR_phase;
     VAR_BIN_OP_AND_uxn_opcodes_h_l910_c21_dfbe_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l904_c7_1985_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l901_c7_1223_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l910_c21_dfbe_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l891_c2_d475_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l898_c7_9d92_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l901_c7_1223_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l912_c11_21ce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l912_c11_21ce_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l912_c11_21ce_left;
     BIN_OP_EQ_uxn_opcodes_h_l912_c11_21ce_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l912_c11_21ce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l912_c11_21ce_return_output := BIN_OP_EQ_uxn_opcodes_h_l912_c11_21ce_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l907_c30_1fe1] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l907_c30_1fe1_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l907_c30_1fe1_ins;
     sp_relative_shift_uxn_opcodes_h_l907_c30_1fe1_x <= VAR_sp_relative_shift_uxn_opcodes_h_l907_c30_1fe1_x;
     sp_relative_shift_uxn_opcodes_h_l907_c30_1fe1_y <= VAR_sp_relative_shift_uxn_opcodes_h_l907_c30_1fe1_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l907_c30_1fe1_return_output := sp_relative_shift_uxn_opcodes_h_l907_c30_1fe1_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l891_l904_l901_l898_DUPLICATE_d188 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l891_l904_l901_l898_DUPLICATE_d188_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l904_l901_l898_l912_DUPLICATE_a401 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l904_l901_l898_l912_DUPLICATE_a401_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l901_c11_d4b8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l901_c11_d4b8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_d4b8_left;
     BIN_OP_EQ_uxn_opcodes_h_l901_c11_d4b8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_d4b8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_d4b8_return_output := BIN_OP_EQ_uxn_opcodes_h_l901_c11_d4b8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l898_c11_0eca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l898_c11_0eca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_0eca_left;
     BIN_OP_EQ_uxn_opcodes_h_l898_c11_0eca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_0eca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_0eca_return_output := BIN_OP_EQ_uxn_opcodes_h_l898_c11_0eca_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l891_c6_e412] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l891_c6_e412_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c6_e412_left;
     BIN_OP_EQ_uxn_opcodes_h_l891_c6_e412_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c6_e412_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c6_e412_return_output := BIN_OP_EQ_uxn_opcodes_h_l891_c6_e412_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l891_l901_l898_l912_DUPLICATE_319f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l891_l901_l898_l912_DUPLICATE_319f_return_output := result.is_stack_write;

     -- BIN_OP_AND[uxn_opcodes_h_l910_c21_dfbe] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l910_c21_dfbe_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l910_c21_dfbe_left;
     BIN_OP_AND_uxn_opcodes_h_l910_c21_dfbe_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l910_c21_dfbe_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l910_c21_dfbe_return_output := BIN_OP_AND_uxn_opcodes_h_l910_c21_dfbe_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l891_l901_l898_l912_DUPLICATE_5c09 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l891_l901_l898_l912_DUPLICATE_5c09_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l904_c11_201c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l904_c11_201c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c11_201c_left;
     BIN_OP_EQ_uxn_opcodes_h_l904_c11_201c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c11_201c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c11_201c_return_output := BIN_OP_EQ_uxn_opcodes_h_l904_c11_201c_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l904_l901_DUPLICATE_45b3 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l904_l901_DUPLICATE_45b3_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c7_1985_iftrue := VAR_BIN_OP_AND_uxn_opcodes_h_l910_c21_dfbe_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l891_c2_d475_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c6_e412_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c2_d475_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c6_e412_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c2_d475_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c6_e412_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c2_d475_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c6_e412_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c2_d475_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c6_e412_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c2_d475_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c6_e412_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l891_c2_d475_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c6_e412_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l898_c7_9d92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_0eca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9d92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_0eca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9d92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_0eca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9d92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_0eca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9d92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_0eca_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l898_c7_9d92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_0eca_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l898_c7_9d92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l898_c11_0eca_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l901_c7_1223_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_d4b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_1223_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_d4b8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_1223_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_d4b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_1223_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_d4b8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_1223_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_d4b8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l901_c7_1223_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_d4b8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l901_c7_1223_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l901_c11_d4b8_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l904_c7_1985_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c11_201c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c7_1985_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c11_201c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c7_1985_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c11_201c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c7_1985_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c11_201c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c7_1985_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c11_201c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c7_1985_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l904_c11_201c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_2911_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l912_c11_21ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_2911_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l912_c11_21ce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l912_c7_2911_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l912_c11_21ce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c2_d475_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l891_l901_l898_l912_DUPLICATE_5c09_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9d92_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l891_l901_l898_l912_DUPLICATE_5c09_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_1223_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l891_l901_l898_l912_DUPLICATE_5c09_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l912_c7_2911_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l891_l901_l898_l912_DUPLICATE_5c09_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9d92_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l904_l901_l898_l912_DUPLICATE_a401_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_1223_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l904_l901_l898_l912_DUPLICATE_a401_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c7_1985_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l904_l901_l898_l912_DUPLICATE_a401_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_2911_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l904_l901_l898_l912_DUPLICATE_a401_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c2_d475_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l891_l901_l898_l912_DUPLICATE_319f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9d92_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l891_l901_l898_l912_DUPLICATE_319f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_1223_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l891_l901_l898_l912_DUPLICATE_319f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_2911_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l891_l901_l898_l912_DUPLICATE_319f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_1223_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l904_l901_DUPLICATE_45b3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c7_1985_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l904_l901_DUPLICATE_45b3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c2_d475_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l891_l904_l901_l898_DUPLICATE_d188_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l898_c7_9d92_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l891_l904_l901_l898_DUPLICATE_d188_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l901_c7_1223_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l891_l904_l901_l898_DUPLICATE_d188_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c7_1985_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l891_l904_l901_l898_DUPLICATE_d188_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c7_1985_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l907_c30_1fe1_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l912_c7_2911] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_2911_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_2911_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_2911_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_2911_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_2911_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_2911_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_2911_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_2911_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l904_c7_1985] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c7_1985_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c7_1985_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c7_1985_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c7_1985_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c7_1985_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c7_1985_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c7_1985_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c7_1985_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l904_c7_1985] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l904_c7_1985_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c7_1985_cond;
     result_u8_value_MUX_uxn_opcodes_h_l904_c7_1985_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c7_1985_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l904_c7_1985_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c7_1985_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c7_1985_return_output := result_u8_value_MUX_uxn_opcodes_h_l904_c7_1985_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l912_c7_2911] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_2911_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_2911_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_2911_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_2911_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_2911_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_2911_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_2911_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_2911_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l912_c7_2911] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l912_c7_2911_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l912_c7_2911_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l912_c7_2911_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l912_c7_2911_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l912_c7_2911_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l912_c7_2911_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l912_c7_2911_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l912_c7_2911_return_output;

     -- t8_MUX[uxn_opcodes_h_l901_c7_1223] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l901_c7_1223_cond <= VAR_t8_MUX_uxn_opcodes_h_l901_c7_1223_cond;
     t8_MUX_uxn_opcodes_h_l901_c7_1223_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l901_c7_1223_iftrue;
     t8_MUX_uxn_opcodes_h_l901_c7_1223_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l901_c7_1223_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l901_c7_1223_return_output := t8_MUX_uxn_opcodes_h_l901_c7_1223_return_output;

     -- n8_MUX[uxn_opcodes_h_l904_c7_1985] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l904_c7_1985_cond <= VAR_n8_MUX_uxn_opcodes_h_l904_c7_1985_cond;
     n8_MUX_uxn_opcodes_h_l904_c7_1985_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l904_c7_1985_iftrue;
     n8_MUX_uxn_opcodes_h_l904_c7_1985_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l904_c7_1985_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l904_c7_1985_return_output := n8_MUX_uxn_opcodes_h_l904_c7_1985_return_output;

     -- Submodule level 2
     VAR_n8_MUX_uxn_opcodes_h_l901_c7_1223_iffalse := VAR_n8_MUX_uxn_opcodes_h_l904_c7_1985_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c7_1985_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_2911_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c7_1985_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_2911_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c7_1985_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l912_c7_2911_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_1223_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l904_c7_1985_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l901_c7_1223_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l904_c7_1985_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l898_c7_9d92_iffalse := VAR_t8_MUX_uxn_opcodes_h_l901_c7_1223_return_output;
     -- t8_MUX[uxn_opcodes_h_l898_c7_9d92] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l898_c7_9d92_cond <= VAR_t8_MUX_uxn_opcodes_h_l898_c7_9d92_cond;
     t8_MUX_uxn_opcodes_h_l898_c7_9d92_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l898_c7_9d92_iftrue;
     t8_MUX_uxn_opcodes_h_l898_c7_9d92_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l898_c7_9d92_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l898_c7_9d92_return_output := t8_MUX_uxn_opcodes_h_l898_c7_9d92_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l904_c7_1985] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l904_c7_1985_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c7_1985_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l904_c7_1985_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c7_1985_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l904_c7_1985_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c7_1985_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c7_1985_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l904_c7_1985_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l904_c7_1985] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c7_1985_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c7_1985_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c7_1985_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c7_1985_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c7_1985_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c7_1985_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c7_1985_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c7_1985_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l901_c7_1223] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_1223_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_1223_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_1223_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_1223_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_1223_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_1223_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_1223_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_1223_return_output;

     -- n8_MUX[uxn_opcodes_h_l901_c7_1223] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l901_c7_1223_cond <= VAR_n8_MUX_uxn_opcodes_h_l901_c7_1223_cond;
     n8_MUX_uxn_opcodes_h_l901_c7_1223_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l901_c7_1223_iftrue;
     n8_MUX_uxn_opcodes_h_l901_c7_1223_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l901_c7_1223_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l901_c7_1223_return_output := n8_MUX_uxn_opcodes_h_l901_c7_1223_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l904_c7_1985] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l904_c7_1985_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c7_1985_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l904_c7_1985_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c7_1985_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l904_c7_1985_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c7_1985_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c7_1985_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l904_c7_1985_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l901_c7_1223] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l901_c7_1223_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l901_c7_1223_cond;
     result_u8_value_MUX_uxn_opcodes_h_l901_c7_1223_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l901_c7_1223_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l901_c7_1223_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l901_c7_1223_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l901_c7_1223_return_output := result_u8_value_MUX_uxn_opcodes_h_l901_c7_1223_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l898_c7_9d92_iffalse := VAR_n8_MUX_uxn_opcodes_h_l901_c7_1223_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_1223_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l904_c7_1985_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_1223_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l904_c7_1985_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_1223_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l904_c7_1985_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9d92_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l901_c7_1223_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l898_c7_9d92_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l901_c7_1223_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l891_c2_d475_iffalse := VAR_t8_MUX_uxn_opcodes_h_l898_c7_9d92_return_output;
     -- n8_MUX[uxn_opcodes_h_l898_c7_9d92] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l898_c7_9d92_cond <= VAR_n8_MUX_uxn_opcodes_h_l898_c7_9d92_cond;
     n8_MUX_uxn_opcodes_h_l898_c7_9d92_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l898_c7_9d92_iftrue;
     n8_MUX_uxn_opcodes_h_l898_c7_9d92_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l898_c7_9d92_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l898_c7_9d92_return_output := n8_MUX_uxn_opcodes_h_l898_c7_9d92_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l901_c7_1223] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_1223_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_1223_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_1223_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_1223_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_1223_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_1223_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_1223_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_1223_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l898_c7_9d92] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l898_c7_9d92_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l898_c7_9d92_cond;
     result_u8_value_MUX_uxn_opcodes_h_l898_c7_9d92_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l898_c7_9d92_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l898_c7_9d92_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l898_c7_9d92_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l898_c7_9d92_return_output := result_u8_value_MUX_uxn_opcodes_h_l898_c7_9d92_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l901_c7_1223] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_1223_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_1223_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_1223_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_1223_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_1223_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_1223_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_1223_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_1223_return_output;

     -- t8_MUX[uxn_opcodes_h_l891_c2_d475] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l891_c2_d475_cond <= VAR_t8_MUX_uxn_opcodes_h_l891_c2_d475_cond;
     t8_MUX_uxn_opcodes_h_l891_c2_d475_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l891_c2_d475_iftrue;
     t8_MUX_uxn_opcodes_h_l891_c2_d475_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l891_c2_d475_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l891_c2_d475_return_output := t8_MUX_uxn_opcodes_h_l891_c2_d475_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l898_c7_9d92] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9d92_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9d92_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9d92_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9d92_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9d92_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9d92_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9d92_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9d92_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l901_c7_1223] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_1223_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_1223_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_1223_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_1223_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_1223_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_1223_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_1223_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_1223_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l891_c2_d475_iffalse := VAR_n8_MUX_uxn_opcodes_h_l898_c7_9d92_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9d92_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l901_c7_1223_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9d92_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l901_c7_1223_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9d92_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l901_c7_1223_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c2_d475_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l898_c7_9d92_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c2_d475_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l898_c7_9d92_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l891_c2_d475_return_output;
     -- n8_MUX[uxn_opcodes_h_l891_c2_d475] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l891_c2_d475_cond <= VAR_n8_MUX_uxn_opcodes_h_l891_c2_d475_cond;
     n8_MUX_uxn_opcodes_h_l891_c2_d475_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l891_c2_d475_iftrue;
     n8_MUX_uxn_opcodes_h_l891_c2_d475_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l891_c2_d475_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l891_c2_d475_return_output := n8_MUX_uxn_opcodes_h_l891_c2_d475_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l898_c7_9d92] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9d92_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9d92_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9d92_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9d92_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9d92_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9d92_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9d92_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9d92_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l898_c7_9d92] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9d92_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9d92_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9d92_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9d92_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9d92_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9d92_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9d92_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9d92_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l891_c2_d475] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l891_c2_d475_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c2_d475_cond;
     result_u8_value_MUX_uxn_opcodes_h_l891_c2_d475_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c2_d475_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l891_c2_d475_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c2_d475_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c2_d475_return_output := result_u8_value_MUX_uxn_opcodes_h_l891_c2_d475_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l891_c2_d475] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c2_d475_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c2_d475_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c2_d475_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c2_d475_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c2_d475_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c2_d475_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c2_d475_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c2_d475_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l898_c7_9d92] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9d92_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9d92_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9d92_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9d92_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9d92_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9d92_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9d92_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9d92_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l891_c2_d475_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c2_d475_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l898_c7_9d92_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c2_d475_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l898_c7_9d92_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c2_d475_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l898_c7_9d92_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l891_c2_d475] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c2_d475_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c2_d475_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c2_d475_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c2_d475_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c2_d475_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c2_d475_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c2_d475_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c2_d475_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l891_c2_d475] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l891_c2_d475_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c2_d475_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l891_c2_d475_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c2_d475_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l891_c2_d475_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c2_d475_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c2_d475_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l891_c2_d475_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l891_c2_d475] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l891_c2_d475_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c2_d475_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l891_c2_d475_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c2_d475_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l891_c2_d475_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c2_d475_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c2_d475_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l891_c2_d475_return_output;

     -- Submodule level 6
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l887_l918_DUPLICATE_3ace LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l887_l918_DUPLICATE_3ace_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_eae7(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c2_d475_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l891_c2_d475_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c2_d475_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c2_d475_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c2_d475_return_output);

     -- Submodule level 7
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l887_l918_DUPLICATE_3ace_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l887_l918_DUPLICATE_3ace_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;