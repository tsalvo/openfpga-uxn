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
-- Submodules: 39
entity str1_0CLK_64d180f1 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(15 downto 0);
 return_output : out opcode_result_t);
end str1_0CLK_64d180f1;
architecture arch of str1_0CLK_64d180f1 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1498_c6_0292]
signal BIN_OP_EQ_uxn_opcodes_h_l1498_c6_0292_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1498_c6_0292_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1498_c6_0292_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1498_c2_7958]
signal result_u16_value_MUX_uxn_opcodes_h_l1498_c2_7958_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1498_c2_7958_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1498_c2_7958_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1498_c2_7958_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1498_c2_7958]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1498_c2_7958_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1498_c2_7958_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1498_c2_7958_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1498_c2_7958_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1498_c2_7958]
signal result_u8_value_MUX_uxn_opcodes_h_l1498_c2_7958_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1498_c2_7958_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1498_c2_7958_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1498_c2_7958_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1498_c2_7958]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c2_7958_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c2_7958_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c2_7958_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c2_7958_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1498_c2_7958]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c2_7958_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c2_7958_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c2_7958_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c2_7958_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1498_c2_7958]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1498_c2_7958_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1498_c2_7958_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1498_c2_7958_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1498_c2_7958_return_output : unsigned(0 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1498_c2_7958]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1498_c2_7958_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1498_c2_7958_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1498_c2_7958_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1498_c2_7958_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1498_c2_7958]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1498_c2_7958_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1498_c2_7958_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1498_c2_7958_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1498_c2_7958_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1498_c2_7958]
signal t8_MUX_uxn_opcodes_h_l1498_c2_7958_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1498_c2_7958_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1498_c2_7958_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1498_c2_7958_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1498_c2_7958]
signal n8_MUX_uxn_opcodes_h_l1498_c2_7958_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1498_c2_7958_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1498_c2_7958_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1498_c2_7958_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1506_c11_78fe]
signal BIN_OP_EQ_uxn_opcodes_h_l1506_c11_78fe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1506_c11_78fe_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1506_c11_78fe_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1506_c7_f52c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1506_c7_f52c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1506_c7_f52c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1506_c7_f52c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1506_c7_f52c]
signal result_u16_value_MUX_uxn_opcodes_h_l1506_c7_f52c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1506_c7_f52c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1506_c7_f52c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output : unsigned(15 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1506_c7_f52c]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1506_c7_f52c_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1506_c7_f52c_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1506_c7_f52c_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1506_c7_f52c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_f52c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_f52c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_f52c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1506_c7_f52c]
signal result_u8_value_MUX_uxn_opcodes_h_l1506_c7_f52c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1506_c7_f52c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1506_c7_f52c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1506_c7_f52c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_f52c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_f52c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_f52c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1506_c7_f52c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1506_c7_f52c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1506_c7_f52c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1506_c7_f52c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1506_c7_f52c]
signal t8_MUX_uxn_opcodes_h_l1506_c7_f52c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1506_c7_f52c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1506_c7_f52c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1506_c7_f52c]
signal n8_MUX_uxn_opcodes_h_l1506_c7_f52c_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1506_c7_f52c_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1506_c7_f52c_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1509_c30_fe34]
signal sp_relative_shift_uxn_opcodes_h_l1509_c30_fe34_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1509_c30_fe34_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1509_c30_fe34_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1509_c30_fe34_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1511_c11_54e9]
signal BIN_OP_EQ_uxn_opcodes_h_l1511_c11_54e9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1511_c11_54e9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1511_c11_54e9_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1511_c7_95fe]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1511_c7_95fe_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1511_c7_95fe_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1511_c7_95fe_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1511_c7_95fe_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1511_c7_95fe]
signal result_u16_value_MUX_uxn_opcodes_h_l1511_c7_95fe_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1511_c7_95fe_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1511_c7_95fe_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1511_c7_95fe_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1511_c7_95fe]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_95fe_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_95fe_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_95fe_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_95fe_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1511_c7_95fe]
signal result_u8_value_MUX_uxn_opcodes_h_l1511_c7_95fe_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1511_c7_95fe_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1511_c7_95fe_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1511_c7_95fe_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1511_c7_95fe]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1511_c7_95fe_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1511_c7_95fe_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1511_c7_95fe_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1511_c7_95fe_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1511_c7_95fe]
signal t8_MUX_uxn_opcodes_h_l1511_c7_95fe_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1511_c7_95fe_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1511_c7_95fe_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1511_c7_95fe_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1511_c7_95fe]
signal n8_MUX_uxn_opcodes_h_l1511_c7_95fe_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1511_c7_95fe_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1511_c7_95fe_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1511_c7_95fe_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1513_c18_1ede]
signal CONST_SR_8_uxn_opcodes_h_l1513_c18_1ede_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1513_c18_1ede_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1516_c22_cca4]
signal BIN_OP_PLUS_uxn_opcodes_h_l1516_c22_cca4_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1516_c22_cca4_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1516_c22_cca4_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1519_c11_3135]
signal BIN_OP_EQ_uxn_opcodes_h_l1519_c11_3135_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1519_c11_3135_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1519_c11_3135_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1519_c7_24ef]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1519_c7_24ef_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1519_c7_24ef_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1519_c7_24ef_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1519_c7_24ef_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1519_c7_24ef]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1519_c7_24ef_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1519_c7_24ef_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1519_c7_24ef_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1519_c7_24ef_return_output : unsigned(0 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_c7f2( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u16_value := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.u8_value := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_sp_shift := ref_toks_6;
      base.is_stack_operation_16bit := ref_toks_7;
      base.is_ram_write := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1498_c6_0292
BIN_OP_EQ_uxn_opcodes_h_l1498_c6_0292 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1498_c6_0292_left,
BIN_OP_EQ_uxn_opcodes_h_l1498_c6_0292_right,
BIN_OP_EQ_uxn_opcodes_h_l1498_c6_0292_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1498_c2_7958
result_u16_value_MUX_uxn_opcodes_h_l1498_c2_7958 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1498_c2_7958_cond,
result_u16_value_MUX_uxn_opcodes_h_l1498_c2_7958_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1498_c2_7958_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1498_c2_7958_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1498_c2_7958
result_is_opc_done_MUX_uxn_opcodes_h_l1498_c2_7958 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1498_c2_7958_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1498_c2_7958_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1498_c2_7958_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1498_c2_7958_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1498_c2_7958
result_u8_value_MUX_uxn_opcodes_h_l1498_c2_7958 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1498_c2_7958_cond,
result_u8_value_MUX_uxn_opcodes_h_l1498_c2_7958_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1498_c2_7958_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1498_c2_7958_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c2_7958
result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c2_7958 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c2_7958_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c2_7958_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c2_7958_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c2_7958_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c2_7958
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c2_7958 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c2_7958_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c2_7958_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c2_7958_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c2_7958_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1498_c2_7958
result_is_sp_shift_MUX_uxn_opcodes_h_l1498_c2_7958 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1498_c2_7958_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1498_c2_7958_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1498_c2_7958_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1498_c2_7958_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1498_c2_7958
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1498_c2_7958 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1498_c2_7958_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1498_c2_7958_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1498_c2_7958_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1498_c2_7958_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1498_c2_7958
result_is_ram_write_MUX_uxn_opcodes_h_l1498_c2_7958 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1498_c2_7958_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1498_c2_7958_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1498_c2_7958_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1498_c2_7958_return_output);

-- t8_MUX_uxn_opcodes_h_l1498_c2_7958
t8_MUX_uxn_opcodes_h_l1498_c2_7958 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1498_c2_7958_cond,
t8_MUX_uxn_opcodes_h_l1498_c2_7958_iftrue,
t8_MUX_uxn_opcodes_h_l1498_c2_7958_iffalse,
t8_MUX_uxn_opcodes_h_l1498_c2_7958_return_output);

-- n8_MUX_uxn_opcodes_h_l1498_c2_7958
n8_MUX_uxn_opcodes_h_l1498_c2_7958 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1498_c2_7958_cond,
n8_MUX_uxn_opcodes_h_l1498_c2_7958_iftrue,
n8_MUX_uxn_opcodes_h_l1498_c2_7958_iffalse,
n8_MUX_uxn_opcodes_h_l1498_c2_7958_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1506_c11_78fe
BIN_OP_EQ_uxn_opcodes_h_l1506_c11_78fe : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1506_c11_78fe_left,
BIN_OP_EQ_uxn_opcodes_h_l1506_c11_78fe_right,
BIN_OP_EQ_uxn_opcodes_h_l1506_c11_78fe_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1506_c7_f52c
result_is_sp_shift_MUX_uxn_opcodes_h_l1506_c7_f52c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1506_c7_f52c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1506_c7_f52c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1506_c7_f52c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1506_c7_f52c
result_u16_value_MUX_uxn_opcodes_h_l1506_c7_f52c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1506_c7_f52c_cond,
result_u16_value_MUX_uxn_opcodes_h_l1506_c7_f52c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1506_c7_f52c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1506_c7_f52c
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1506_c7_f52c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1506_c7_f52c_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1506_c7_f52c_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1506_c7_f52c_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_f52c
result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_f52c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_f52c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_f52c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_f52c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1506_c7_f52c
result_u8_value_MUX_uxn_opcodes_h_l1506_c7_f52c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1506_c7_f52c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1506_c7_f52c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1506_c7_f52c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_f52c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_f52c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_f52c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_f52c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_f52c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1506_c7_f52c
result_is_ram_write_MUX_uxn_opcodes_h_l1506_c7_f52c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1506_c7_f52c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1506_c7_f52c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1506_c7_f52c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output);

-- t8_MUX_uxn_opcodes_h_l1506_c7_f52c
t8_MUX_uxn_opcodes_h_l1506_c7_f52c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1506_c7_f52c_cond,
t8_MUX_uxn_opcodes_h_l1506_c7_f52c_iftrue,
t8_MUX_uxn_opcodes_h_l1506_c7_f52c_iffalse,
t8_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output);

-- n8_MUX_uxn_opcodes_h_l1506_c7_f52c
n8_MUX_uxn_opcodes_h_l1506_c7_f52c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1506_c7_f52c_cond,
n8_MUX_uxn_opcodes_h_l1506_c7_f52c_iftrue,
n8_MUX_uxn_opcodes_h_l1506_c7_f52c_iffalse,
n8_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1509_c30_fe34
sp_relative_shift_uxn_opcodes_h_l1509_c30_fe34 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1509_c30_fe34_ins,
sp_relative_shift_uxn_opcodes_h_l1509_c30_fe34_x,
sp_relative_shift_uxn_opcodes_h_l1509_c30_fe34_y,
sp_relative_shift_uxn_opcodes_h_l1509_c30_fe34_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1511_c11_54e9
BIN_OP_EQ_uxn_opcodes_h_l1511_c11_54e9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1511_c11_54e9_left,
BIN_OP_EQ_uxn_opcodes_h_l1511_c11_54e9_right,
BIN_OP_EQ_uxn_opcodes_h_l1511_c11_54e9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1511_c7_95fe
result_is_sp_shift_MUX_uxn_opcodes_h_l1511_c7_95fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1511_c7_95fe_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1511_c7_95fe_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1511_c7_95fe_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1511_c7_95fe_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1511_c7_95fe
result_u16_value_MUX_uxn_opcodes_h_l1511_c7_95fe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1511_c7_95fe_cond,
result_u16_value_MUX_uxn_opcodes_h_l1511_c7_95fe_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1511_c7_95fe_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1511_c7_95fe_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_95fe
result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_95fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_95fe_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_95fe_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_95fe_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_95fe_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1511_c7_95fe
result_u8_value_MUX_uxn_opcodes_h_l1511_c7_95fe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1511_c7_95fe_cond,
result_u8_value_MUX_uxn_opcodes_h_l1511_c7_95fe_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1511_c7_95fe_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1511_c7_95fe_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1511_c7_95fe
result_is_ram_write_MUX_uxn_opcodes_h_l1511_c7_95fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1511_c7_95fe_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1511_c7_95fe_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1511_c7_95fe_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1511_c7_95fe_return_output);

-- t8_MUX_uxn_opcodes_h_l1511_c7_95fe
t8_MUX_uxn_opcodes_h_l1511_c7_95fe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1511_c7_95fe_cond,
t8_MUX_uxn_opcodes_h_l1511_c7_95fe_iftrue,
t8_MUX_uxn_opcodes_h_l1511_c7_95fe_iffalse,
t8_MUX_uxn_opcodes_h_l1511_c7_95fe_return_output);

-- n8_MUX_uxn_opcodes_h_l1511_c7_95fe
n8_MUX_uxn_opcodes_h_l1511_c7_95fe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1511_c7_95fe_cond,
n8_MUX_uxn_opcodes_h_l1511_c7_95fe_iftrue,
n8_MUX_uxn_opcodes_h_l1511_c7_95fe_iffalse,
n8_MUX_uxn_opcodes_h_l1511_c7_95fe_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1513_c18_1ede
CONST_SR_8_uxn_opcodes_h_l1513_c18_1ede : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1513_c18_1ede_x,
CONST_SR_8_uxn_opcodes_h_l1513_c18_1ede_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1516_c22_cca4
BIN_OP_PLUS_uxn_opcodes_h_l1516_c22_cca4 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1516_c22_cca4_left,
BIN_OP_PLUS_uxn_opcodes_h_l1516_c22_cca4_right,
BIN_OP_PLUS_uxn_opcodes_h_l1516_c22_cca4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1519_c11_3135
BIN_OP_EQ_uxn_opcodes_h_l1519_c11_3135 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1519_c11_3135_left,
BIN_OP_EQ_uxn_opcodes_h_l1519_c11_3135_right,
BIN_OP_EQ_uxn_opcodes_h_l1519_c11_3135_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1519_c7_24ef
result_is_opc_done_MUX_uxn_opcodes_h_l1519_c7_24ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1519_c7_24ef_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1519_c7_24ef_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1519_c7_24ef_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1519_c7_24ef_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1519_c7_24ef
result_is_ram_write_MUX_uxn_opcodes_h_l1519_c7_24ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1519_c7_24ef_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1519_c7_24ef_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1519_c7_24ef_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1519_c7_24ef_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 -- Registers
 t8,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1498_c6_0292_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1498_c2_7958_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1498_c2_7958_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1498_c2_7958_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c2_7958_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c2_7958_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1498_c2_7958_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1498_c2_7958_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1498_c2_7958_return_output,
 t8_MUX_uxn_opcodes_h_l1498_c2_7958_return_output,
 n8_MUX_uxn_opcodes_h_l1498_c2_7958_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1506_c11_78fe_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output,
 t8_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output,
 n8_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output,
 sp_relative_shift_uxn_opcodes_h_l1509_c30_fe34_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1511_c11_54e9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1511_c7_95fe_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1511_c7_95fe_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_95fe_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1511_c7_95fe_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1511_c7_95fe_return_output,
 t8_MUX_uxn_opcodes_h_l1511_c7_95fe_return_output,
 n8_MUX_uxn_opcodes_h_l1511_c7_95fe_return_output,
 CONST_SR_8_uxn_opcodes_h_l1513_c18_1ede_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1516_c22_cca4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1519_c11_3135_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1519_c7_24ef_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1519_c7_24ef_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c6_0292_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c6_0292_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c6_0292_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1498_c2_7958_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1498_c2_7958_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1498_c2_7958_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1498_c2_7958_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c2_7958_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c2_7958_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c2_7958_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c2_7958_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1498_c2_7958_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1498_c2_7958_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1498_c2_7958_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1498_c2_7958_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c2_7958_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c2_7958_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c2_7958_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c2_7958_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c2_7958_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1503_c3_bc5e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c2_7958_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1498_c2_7958_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c2_7958_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c2_7958_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1498_c2_7958_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1498_c2_7958_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1498_c2_7958_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1498_c2_7958_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1498_c2_7958_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1498_c2_7958_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1498_c2_7958_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1498_c2_7958_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1498_c2_7958_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1498_c2_7958_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1498_c2_7958_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1498_c2_7958_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1498_c2_7958_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1498_c2_7958_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1498_c2_7958_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1498_c2_7958_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1498_c2_7958_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1498_c2_7958_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1498_c2_7958_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1498_c2_7958_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_78fe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_78fe_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_78fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1506_c7_f52c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1506_c7_f52c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1511_c7_95fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1506_c7_f52c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1506_c7_f52c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1506_c7_f52c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1511_c7_95fe_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1506_c7_f52c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1506_c7_f52c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1506_c7_f52c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l1506_c7_f52c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1506_c7_f52c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_f52c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_f52c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_95fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_f52c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1506_c7_f52c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1506_c7_f52c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1511_c7_95fe_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1506_c7_f52c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_f52c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_f52c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_f52c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1506_c7_f52c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1506_c7_f52c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1511_c7_95fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1506_c7_f52c_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1506_c7_f52c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1506_c7_f52c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1511_c7_95fe_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1506_c7_f52c_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1506_c7_f52c_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1506_c7_f52c_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1511_c7_95fe_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1506_c7_f52c_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1509_c30_fe34_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1509_c30_fe34_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1509_c30_fe34_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1509_c30_fe34_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1511_c11_54e9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1511_c11_54e9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1511_c11_54e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1511_c7_95fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1511_c7_95fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1511_c7_95fe_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1511_c7_95fe_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1516_c3_a89a : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1511_c7_95fe_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1511_c7_95fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_95fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_95fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1519_c7_24ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_95fe_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1511_c7_95fe_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1511_c7_95fe_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1511_c7_95fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1511_c7_95fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1511_c7_95fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1519_c7_24ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1511_c7_95fe_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1511_c7_95fe_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1511_c7_95fe_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1511_c7_95fe_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1511_c7_95fe_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1511_c7_95fe_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1511_c7_95fe_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1512_c8_bee9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1513_c18_1ede_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1513_c18_1ede_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1513_c8_6f81_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1516_c22_cca4_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1516_c27_0a56_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1516_c22_cca4_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1516_c22_cca4_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1519_c11_3135_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1519_c11_3135_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1519_c11_3135_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1519_c7_24ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1519_c7_24ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1519_c7_24ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1519_c7_24ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1519_c7_24ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1519_c7_24ef_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1506_l1511_l1498_DUPLICATE_55d5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1506_l1511_l1498_DUPLICATE_5118_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1506_l1498_DUPLICATE_1616_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1511_l1498_DUPLICATE_670e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1506_l1498_l1519_DUPLICATE_57c6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1506_l1511_l1519_DUPLICATE_6bbb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c7f2_uxn_opcodes_h_l1524_l1494_DUPLICATE_9884_return_output : opcode_result_t;
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
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1506_c7_f52c_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1509_c30_fe34_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1506_c7_f52c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c6_0292_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_78fe_right := to_unsigned(1, 1);
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1498_c2_7958_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1509_c30_fe34_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1519_c7_24ef_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1519_c7_24ef_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1511_c7_95fe_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1519_c11_3135_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1511_c11_54e9_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1503_c3_bc5e := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c2_7958_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1503_c3_bc5e;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c2_7958_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1511_c7_95fe_iftrue := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;

     -- Submodule level 0
     VAR_sp_relative_shift_uxn_opcodes_h_l1509_c30_fe34_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l1498_c2_7958_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1506_c7_f52c_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1511_c7_95fe_iffalse := n8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1516_c22_cca4_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c6_0292_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_78fe_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1511_c11_54e9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1519_c11_3135_left := VAR_phase;
     VAR_CONST_SR_8_uxn_opcodes_h_l1513_c18_1ede_x := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1498_c2_7958_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1506_c7_f52c_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1511_c7_95fe_iffalse := t8;
     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1506_l1498_DUPLICATE_1616 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1506_l1498_DUPLICATE_1616_return_output := result.sp_relative_shift;

     -- sp_relative_shift[uxn_opcodes_h_l1509_c30_fe34] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1509_c30_fe34_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1509_c30_fe34_ins;
     sp_relative_shift_uxn_opcodes_h_l1509_c30_fe34_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1509_c30_fe34_x;
     sp_relative_shift_uxn_opcodes_h_l1509_c30_fe34_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1509_c30_fe34_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1509_c30_fe34_return_output := sp_relative_shift_uxn_opcodes_h_l1509_c30_fe34_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1506_l1511_l1498_DUPLICATE_55d5 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1506_l1511_l1498_DUPLICATE_55d5_return_output := result.u16_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1506_l1511_l1498_DUPLICATE_5118 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1506_l1511_l1498_DUPLICATE_5118_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1506_c11_78fe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1506_c11_78fe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_78fe_left;
     BIN_OP_EQ_uxn_opcodes_h_l1506_c11_78fe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_78fe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_78fe_return_output := BIN_OP_EQ_uxn_opcodes_h_l1506_c11_78fe_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1498_c2_7958] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1498_c2_7958_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1506_l1498_l1519_DUPLICATE_57c6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1506_l1498_l1519_DUPLICATE_57c6_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1511_c11_54e9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1511_c11_54e9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1511_c11_54e9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1511_c11_54e9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1511_c11_54e9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1511_c11_54e9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1511_c11_54e9_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1512_c8_bee9] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1512_c8_bee9_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1506_l1511_l1519_DUPLICATE_6bbb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1506_l1511_l1519_DUPLICATE_6bbb_return_output := result.is_opc_done;

     -- result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d[uxn_opcodes_h_l1506_c7_f52c] LATENCY=0
     VAR_result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l1506_c7_f52c_return_output := result.is_stack_operation_16bit;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1511_l1498_DUPLICATE_670e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1511_l1498_DUPLICATE_670e_return_output := result.is_sp_shift;

     -- CONST_SR_8[uxn_opcodes_h_l1513_c18_1ede] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1513_c18_1ede_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1513_c18_1ede_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1513_c18_1ede_return_output := CONST_SR_8_uxn_opcodes_h_l1513_c18_1ede_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1498_c6_0292] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1498_c6_0292_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c6_0292_left;
     BIN_OP_EQ_uxn_opcodes_h_l1498_c6_0292_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c6_0292_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c6_0292_return_output := BIN_OP_EQ_uxn_opcodes_h_l1498_c6_0292_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1519_c11_3135] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1519_c11_3135_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1519_c11_3135_left;
     BIN_OP_EQ_uxn_opcodes_h_l1519_c11_3135_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1519_c11_3135_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1519_c11_3135_return_output := BIN_OP_EQ_uxn_opcodes_h_l1519_c11_3135_return_output;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l1498_c2_7958_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c6_0292_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c2_7958_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c6_0292_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1498_c2_7958_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c6_0292_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1498_c2_7958_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c6_0292_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1498_c2_7958_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c6_0292_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c2_7958_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c6_0292_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c2_7958_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c6_0292_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1498_c2_7958_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c6_0292_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1498_c2_7958_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c6_0292_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1498_c2_7958_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c6_0292_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1506_c7_f52c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_78fe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_f52c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_78fe_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1506_c7_f52c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_78fe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1506_c7_f52c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_78fe_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1506_c7_f52c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_78fe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_f52c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_78fe_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1506_c7_f52c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_78fe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1506_c7_f52c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_78fe_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1506_c7_f52c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_78fe_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1511_c7_95fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1511_c11_54e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_95fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1511_c11_54e9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1511_c7_95fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1511_c11_54e9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1511_c7_95fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1511_c11_54e9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1511_c7_95fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1511_c11_54e9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1511_c7_95fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1511_c11_54e9_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1511_c7_95fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1511_c11_54e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1519_c7_24ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1519_c11_3135_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1519_c7_24ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1519_c11_3135_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1511_c7_95fe_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1512_c8_bee9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c2_7958_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1506_l1498_DUPLICATE_1616_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_f52c_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1506_l1498_DUPLICATE_1616_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1498_c2_7958_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1506_l1511_l1498_DUPLICATE_55d5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1506_c7_f52c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1506_l1511_l1498_DUPLICATE_55d5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1511_c7_95fe_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1506_l1511_l1498_DUPLICATE_55d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_f52c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1506_l1511_l1519_DUPLICATE_6bbb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_95fe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1506_l1511_l1519_DUPLICATE_6bbb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1519_c7_24ef_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1506_l1511_l1519_DUPLICATE_6bbb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1498_c2_7958_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1506_l1498_l1519_DUPLICATE_57c6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1506_c7_f52c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1506_l1498_l1519_DUPLICATE_57c6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1519_c7_24ef_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1506_l1498_l1519_DUPLICATE_57c6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1498_c2_7958_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1511_l1498_DUPLICATE_670e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1511_c7_95fe_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1511_l1498_DUPLICATE_670e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1498_c2_7958_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1506_l1511_l1498_DUPLICATE_5118_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1506_c7_f52c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1506_l1511_l1498_DUPLICATE_5118_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1511_c7_95fe_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1506_l1511_l1498_DUPLICATE_5118_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1506_c7_f52c_iffalse := VAR_result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l1506_c7_f52c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c2_7958_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1498_c2_7958_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_f52c_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1509_c30_fe34_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1511_c7_95fe] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1511_c7_95fe_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1511_c7_95fe_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1511_c7_95fe_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1511_c7_95fe_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1511_c7_95fe_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1511_c7_95fe_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1511_c7_95fe_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1511_c7_95fe_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1498_c2_7958] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c2_7958_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c2_7958_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c2_7958_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c2_7958_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c2_7958_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c2_7958_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c2_7958_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c2_7958_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1516_c27_0a56] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1516_c27_0a56_return_output := CAST_TO_int8_t_uint8_t(
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1512_c8_bee9_return_output);

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1513_c8_6f81] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1513_c8_6f81_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1513_c18_1ede_return_output);

     -- t8_MUX[uxn_opcodes_h_l1511_c7_95fe] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1511_c7_95fe_cond <= VAR_t8_MUX_uxn_opcodes_h_l1511_c7_95fe_cond;
     t8_MUX_uxn_opcodes_h_l1511_c7_95fe_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1511_c7_95fe_iftrue;
     t8_MUX_uxn_opcodes_h_l1511_c7_95fe_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1511_c7_95fe_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1511_c7_95fe_return_output := t8_MUX_uxn_opcodes_h_l1511_c7_95fe_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1506_c7_f52c] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1506_c7_f52c_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1506_c7_f52c_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1506_c7_f52c_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1506_c7_f52c_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1506_c7_f52c_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1506_c7_f52c_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1506_c7_f52c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_f52c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_f52c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_f52c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_f52c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_f52c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_f52c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1519_c7_24ef] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1519_c7_24ef_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1519_c7_24ef_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1519_c7_24ef_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1519_c7_24ef_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1519_c7_24ef_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1519_c7_24ef_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1519_c7_24ef_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1519_c7_24ef_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1519_c7_24ef] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1519_c7_24ef_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1519_c7_24ef_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1519_c7_24ef_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1519_c7_24ef_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1519_c7_24ef_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1519_c7_24ef_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1519_c7_24ef_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1519_c7_24ef_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1516_c22_cca4_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1516_c27_0a56_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1511_c7_95fe_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1513_c8_6f81_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1511_c7_95fe_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1513_c8_6f81_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_95fe_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1519_c7_24ef_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1511_c7_95fe_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1519_c7_24ef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1506_c7_f52c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1511_c7_95fe_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1498_c2_7958_iffalse := VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c2_7958_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1506_c7_f52c_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1511_c7_95fe_return_output;
     -- n8_MUX[uxn_opcodes_h_l1511_c7_95fe] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1511_c7_95fe_cond <= VAR_n8_MUX_uxn_opcodes_h_l1511_c7_95fe_cond;
     n8_MUX_uxn_opcodes_h_l1511_c7_95fe_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1511_c7_95fe_iftrue;
     n8_MUX_uxn_opcodes_h_l1511_c7_95fe_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1511_c7_95fe_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1511_c7_95fe_return_output := n8_MUX_uxn_opcodes_h_l1511_c7_95fe_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1498_c2_7958] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c2_7958_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c2_7958_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c2_7958_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c2_7958_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c2_7958_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c2_7958_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c2_7958_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c2_7958_return_output;

     -- t8_MUX[uxn_opcodes_h_l1506_c7_f52c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1506_c7_f52c_cond <= VAR_t8_MUX_uxn_opcodes_h_l1506_c7_f52c_cond;
     t8_MUX_uxn_opcodes_h_l1506_c7_f52c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1506_c7_f52c_iftrue;
     t8_MUX_uxn_opcodes_h_l1506_c7_f52c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1506_c7_f52c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output := t8_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1511_c7_95fe] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1511_c7_95fe_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1511_c7_95fe_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1511_c7_95fe_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1511_c7_95fe_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1511_c7_95fe_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1511_c7_95fe_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1511_c7_95fe_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1511_c7_95fe_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1498_c2_7958] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1498_c2_7958_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1498_c2_7958_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1498_c2_7958_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1498_c2_7958_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1498_c2_7958_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1498_c2_7958_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1498_c2_7958_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1498_c2_7958_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1516_c22_cca4] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1516_c22_cca4_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1516_c22_cca4_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1516_c22_cca4_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1516_c22_cca4_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1516_c22_cca4_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1516_c22_cca4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1506_c7_f52c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1506_c7_f52c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1506_c7_f52c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1506_c7_f52c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1506_c7_f52c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1506_c7_f52c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1506_c7_f52c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1511_c7_95fe] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_95fe_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_95fe_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_95fe_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_95fe_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_95fe_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_95fe_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_95fe_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_95fe_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1511_c7_95fe] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1511_c7_95fe_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1511_c7_95fe_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1511_c7_95fe_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1511_c7_95fe_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1511_c7_95fe_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1511_c7_95fe_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1511_c7_95fe_return_output := result_u8_value_MUX_uxn_opcodes_h_l1511_c7_95fe_return_output;

     -- Submodule level 3
     VAR_result_u16_value_uxn_opcodes_h_l1516_c3_a89a := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1516_c22_cca4_return_output)),16);
     VAR_n8_MUX_uxn_opcodes_h_l1506_c7_f52c_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1511_c7_95fe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_f52c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1511_c7_95fe_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1506_c7_f52c_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1511_c7_95fe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1498_c2_7958_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1506_c7_f52c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1511_c7_95fe_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1498_c2_7958_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1511_c7_95fe_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1516_c3_a89a;
     -- result_u8_value_MUX[uxn_opcodes_h_l1506_c7_f52c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1506_c7_f52c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1506_c7_f52c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1506_c7_f52c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1506_c7_f52c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1506_c7_f52c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1506_c7_f52c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1498_c2_7958] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1498_c2_7958_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1498_c2_7958_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1498_c2_7958_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1498_c2_7958_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1498_c2_7958_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1498_c2_7958_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1498_c2_7958_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1498_c2_7958_return_output;

     -- t8_MUX[uxn_opcodes_h_l1498_c2_7958] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1498_c2_7958_cond <= VAR_t8_MUX_uxn_opcodes_h_l1498_c2_7958_cond;
     t8_MUX_uxn_opcodes_h_l1498_c2_7958_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1498_c2_7958_iftrue;
     t8_MUX_uxn_opcodes_h_l1498_c2_7958_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1498_c2_7958_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1498_c2_7958_return_output := t8_MUX_uxn_opcodes_h_l1498_c2_7958_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1506_c7_f52c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1506_c7_f52c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1506_c7_f52c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1506_c7_f52c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1506_c7_f52c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1506_c7_f52c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1506_c7_f52c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1511_c7_95fe] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1511_c7_95fe_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1511_c7_95fe_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1511_c7_95fe_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1511_c7_95fe_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1511_c7_95fe_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1511_c7_95fe_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1511_c7_95fe_return_output := result_u16_value_MUX_uxn_opcodes_h_l1511_c7_95fe_return_output;

     -- n8_MUX[uxn_opcodes_h_l1506_c7_f52c] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1506_c7_f52c_cond <= VAR_n8_MUX_uxn_opcodes_h_l1506_c7_f52c_cond;
     n8_MUX_uxn_opcodes_h_l1506_c7_f52c_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1506_c7_f52c_iftrue;
     n8_MUX_uxn_opcodes_h_l1506_c7_f52c_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1506_c7_f52c_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output := n8_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1506_c7_f52c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_f52c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_f52c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_f52c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_f52c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_f52c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_f52c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1498_c2_7958_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c2_7958_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1498_c2_7958_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1506_c7_f52c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1511_c7_95fe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1498_c2_7958_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1498_c2_7958_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1506_c7_f52c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1506_c7_f52c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1506_c7_f52c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1506_c7_f52c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1506_c7_f52c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1506_c7_f52c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1506_c7_f52c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output := result_u16_value_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output;

     -- n8_MUX[uxn_opcodes_h_l1498_c2_7958] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1498_c2_7958_cond <= VAR_n8_MUX_uxn_opcodes_h_l1498_c2_7958_cond;
     n8_MUX_uxn_opcodes_h_l1498_c2_7958_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1498_c2_7958_iftrue;
     n8_MUX_uxn_opcodes_h_l1498_c2_7958_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1498_c2_7958_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1498_c2_7958_return_output := n8_MUX_uxn_opcodes_h_l1498_c2_7958_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1498_c2_7958] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1498_c2_7958_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c2_7958_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1498_c2_7958_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c2_7958_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1498_c2_7958_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c2_7958_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c2_7958_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1498_c2_7958_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1498_c2_7958] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1498_c2_7958_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1498_c2_7958_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1498_c2_7958_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1498_c2_7958_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1498_c2_7958_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1498_c2_7958_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1498_c2_7958_return_output := result_u8_value_MUX_uxn_opcodes_h_l1498_c2_7958_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1498_c2_7958] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1498_c2_7958_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1498_c2_7958_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1498_c2_7958_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1498_c2_7958_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1498_c2_7958_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1498_c2_7958_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1498_c2_7958_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1498_c2_7958_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1498_c2_7958_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1498_c2_7958_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1506_c7_f52c_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1498_c2_7958] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1498_c2_7958_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1498_c2_7958_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1498_c2_7958_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1498_c2_7958_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1498_c2_7958_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1498_c2_7958_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1498_c2_7958_return_output := result_u16_value_MUX_uxn_opcodes_h_l1498_c2_7958_return_output;

     -- Submodule level 6
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c7f2_uxn_opcodes_h_l1524_l1494_DUPLICATE_9884 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c7f2_uxn_opcodes_h_l1524_l1494_DUPLICATE_9884_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c7f2(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1498_c2_7958_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c2_7958_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1498_c2_7958_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c2_7958_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c2_7958_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1498_c2_7958_return_output,
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1498_c2_7958_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1498_c2_7958_return_output);

     -- Submodule level 7
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c7f2_uxn_opcodes_h_l1524_l1494_DUPLICATE_9884_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c7f2_uxn_opcodes_h_l1524_l1494_DUPLICATE_9884_return_output;
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
