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
entity stz_0CLK_282a76ca is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(15 downto 0);
 return_output : out opcode_result_t);
end stz_0CLK_282a76ca;
architecture arch of stz_0CLK_282a76ca is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1341_c6_a181]
signal BIN_OP_EQ_uxn_opcodes_h_l1341_c6_a181_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1341_c6_a181_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1341_c6_a181_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1341_c2_9248]
signal result_u16_value_MUX_uxn_opcodes_h_l1341_c2_9248_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1341_c2_9248_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1341_c2_9248_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1341_c2_9248_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1341_c2_9248]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_9248_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_9248_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_9248_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_9248_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1341_c2_9248]
signal result_u8_value_MUX_uxn_opcodes_h_l1341_c2_9248_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1341_c2_9248_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1341_c2_9248_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1341_c2_9248_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1341_c2_9248]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_9248_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_9248_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_9248_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_9248_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1341_c2_9248]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_9248_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_9248_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_9248_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_9248_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1341_c2_9248]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c2_9248_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c2_9248_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c2_9248_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c2_9248_return_output : unsigned(0 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1341_c2_9248]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1341_c2_9248_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1341_c2_9248_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1341_c2_9248_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1341_c2_9248_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1341_c2_9248]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1341_c2_9248_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1341_c2_9248_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1341_c2_9248_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1341_c2_9248_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1341_c2_9248]
signal t8_MUX_uxn_opcodes_h_l1341_c2_9248_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1341_c2_9248_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1341_c2_9248_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1341_c2_9248_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1341_c2_9248]
signal n8_MUX_uxn_opcodes_h_l1341_c2_9248_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1341_c2_9248_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1341_c2_9248_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1341_c2_9248_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1349_c11_928e]
signal BIN_OP_EQ_uxn_opcodes_h_l1349_c11_928e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1349_c11_928e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1349_c11_928e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1349_c7_9111]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c7_9111_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c7_9111_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c7_9111_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c7_9111_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1349_c7_9111]
signal result_u16_value_MUX_uxn_opcodes_h_l1349_c7_9111_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1349_c7_9111_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1349_c7_9111_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1349_c7_9111_return_output : unsigned(15 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1349_c7_9111]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1349_c7_9111_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1349_c7_9111_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1349_c7_9111_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1349_c7_9111_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1349_c7_9111]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_9111_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_9111_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_9111_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_9111_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1349_c7_9111]
signal result_u8_value_MUX_uxn_opcodes_h_l1349_c7_9111_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1349_c7_9111_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1349_c7_9111_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1349_c7_9111_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1349_c7_9111]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c7_9111_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c7_9111_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c7_9111_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c7_9111_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1349_c7_9111]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1349_c7_9111_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1349_c7_9111_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1349_c7_9111_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1349_c7_9111_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1349_c7_9111]
signal t8_MUX_uxn_opcodes_h_l1349_c7_9111_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1349_c7_9111_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1349_c7_9111_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1349_c7_9111_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1349_c7_9111]
signal n8_MUX_uxn_opcodes_h_l1349_c7_9111_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1349_c7_9111_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1349_c7_9111_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1349_c7_9111_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1352_c30_f740]
signal sp_relative_shift_uxn_opcodes_h_l1352_c30_f740_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1352_c30_f740_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1352_c30_f740_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1352_c30_f740_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1354_c11_6cf6]
signal BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6cf6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6cf6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6cf6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1354_c7_e1bb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1354_c7_e1bb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1354_c7_e1bb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1354_c7_e1bb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1354_c7_e1bb_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1354_c7_e1bb]
signal result_u16_value_MUX_uxn_opcodes_h_l1354_c7_e1bb_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1354_c7_e1bb_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1354_c7_e1bb_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1354_c7_e1bb_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1354_c7_e1bb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_e1bb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_e1bb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_e1bb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_e1bb_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1354_c7_e1bb]
signal result_u8_value_MUX_uxn_opcodes_h_l1354_c7_e1bb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1354_c7_e1bb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1354_c7_e1bb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1354_c7_e1bb_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1354_c7_e1bb]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1354_c7_e1bb_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1354_c7_e1bb_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1354_c7_e1bb_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1354_c7_e1bb_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1354_c7_e1bb]
signal t8_MUX_uxn_opcodes_h_l1354_c7_e1bb_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1354_c7_e1bb_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1354_c7_e1bb_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1354_c7_e1bb_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1354_c7_e1bb]
signal n8_MUX_uxn_opcodes_h_l1354_c7_e1bb_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1354_c7_e1bb_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1354_c7_e1bb_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1354_c7_e1bb_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1356_c18_4192]
signal CONST_SR_8_uxn_opcodes_h_l1356_c18_4192_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1356_c18_4192_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1362_c11_187d]
signal BIN_OP_EQ_uxn_opcodes_h_l1362_c11_187d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1362_c11_187d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1362_c11_187d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1362_c7_b8fb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1362_c7_b8fb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1362_c7_b8fb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1362_c7_b8fb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1362_c7_b8fb_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1362_c7_b8fb]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1362_c7_b8fb_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1362_c7_b8fb_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1362_c7_b8fb_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1362_c7_b8fb_return_output : unsigned(0 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
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
-- BIN_OP_EQ_uxn_opcodes_h_l1341_c6_a181
BIN_OP_EQ_uxn_opcodes_h_l1341_c6_a181 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1341_c6_a181_left,
BIN_OP_EQ_uxn_opcodes_h_l1341_c6_a181_right,
BIN_OP_EQ_uxn_opcodes_h_l1341_c6_a181_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1341_c2_9248
result_u16_value_MUX_uxn_opcodes_h_l1341_c2_9248 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1341_c2_9248_cond,
result_u16_value_MUX_uxn_opcodes_h_l1341_c2_9248_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1341_c2_9248_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1341_c2_9248_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_9248
result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_9248 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_9248_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_9248_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_9248_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_9248_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1341_c2_9248
result_u8_value_MUX_uxn_opcodes_h_l1341_c2_9248 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1341_c2_9248_cond,
result_u8_value_MUX_uxn_opcodes_h_l1341_c2_9248_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1341_c2_9248_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1341_c2_9248_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_9248
result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_9248 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_9248_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_9248_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_9248_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_9248_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_9248
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_9248 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_9248_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_9248_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_9248_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_9248_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c2_9248
result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c2_9248 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c2_9248_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c2_9248_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c2_9248_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c2_9248_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1341_c2_9248
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1341_c2_9248 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1341_c2_9248_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1341_c2_9248_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1341_c2_9248_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1341_c2_9248_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1341_c2_9248
result_is_ram_write_MUX_uxn_opcodes_h_l1341_c2_9248 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1341_c2_9248_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1341_c2_9248_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1341_c2_9248_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1341_c2_9248_return_output);

-- t8_MUX_uxn_opcodes_h_l1341_c2_9248
t8_MUX_uxn_opcodes_h_l1341_c2_9248 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1341_c2_9248_cond,
t8_MUX_uxn_opcodes_h_l1341_c2_9248_iftrue,
t8_MUX_uxn_opcodes_h_l1341_c2_9248_iffalse,
t8_MUX_uxn_opcodes_h_l1341_c2_9248_return_output);

-- n8_MUX_uxn_opcodes_h_l1341_c2_9248
n8_MUX_uxn_opcodes_h_l1341_c2_9248 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1341_c2_9248_cond,
n8_MUX_uxn_opcodes_h_l1341_c2_9248_iftrue,
n8_MUX_uxn_opcodes_h_l1341_c2_9248_iffalse,
n8_MUX_uxn_opcodes_h_l1341_c2_9248_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1349_c11_928e
BIN_OP_EQ_uxn_opcodes_h_l1349_c11_928e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1349_c11_928e_left,
BIN_OP_EQ_uxn_opcodes_h_l1349_c11_928e_right,
BIN_OP_EQ_uxn_opcodes_h_l1349_c11_928e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c7_9111
result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c7_9111 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c7_9111_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c7_9111_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c7_9111_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c7_9111_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1349_c7_9111
result_u16_value_MUX_uxn_opcodes_h_l1349_c7_9111 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1349_c7_9111_cond,
result_u16_value_MUX_uxn_opcodes_h_l1349_c7_9111_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1349_c7_9111_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1349_c7_9111_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1349_c7_9111
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1349_c7_9111 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1349_c7_9111_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1349_c7_9111_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1349_c7_9111_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1349_c7_9111_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_9111
result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_9111 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_9111_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_9111_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_9111_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_9111_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1349_c7_9111
result_u8_value_MUX_uxn_opcodes_h_l1349_c7_9111 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1349_c7_9111_cond,
result_u8_value_MUX_uxn_opcodes_h_l1349_c7_9111_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1349_c7_9111_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1349_c7_9111_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c7_9111
result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c7_9111 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c7_9111_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c7_9111_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c7_9111_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c7_9111_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1349_c7_9111
result_is_ram_write_MUX_uxn_opcodes_h_l1349_c7_9111 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1349_c7_9111_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1349_c7_9111_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1349_c7_9111_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1349_c7_9111_return_output);

-- t8_MUX_uxn_opcodes_h_l1349_c7_9111
t8_MUX_uxn_opcodes_h_l1349_c7_9111 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1349_c7_9111_cond,
t8_MUX_uxn_opcodes_h_l1349_c7_9111_iftrue,
t8_MUX_uxn_opcodes_h_l1349_c7_9111_iffalse,
t8_MUX_uxn_opcodes_h_l1349_c7_9111_return_output);

-- n8_MUX_uxn_opcodes_h_l1349_c7_9111
n8_MUX_uxn_opcodes_h_l1349_c7_9111 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1349_c7_9111_cond,
n8_MUX_uxn_opcodes_h_l1349_c7_9111_iftrue,
n8_MUX_uxn_opcodes_h_l1349_c7_9111_iffalse,
n8_MUX_uxn_opcodes_h_l1349_c7_9111_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1352_c30_f740
sp_relative_shift_uxn_opcodes_h_l1352_c30_f740 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1352_c30_f740_ins,
sp_relative_shift_uxn_opcodes_h_l1352_c30_f740_x,
sp_relative_shift_uxn_opcodes_h_l1352_c30_f740_y,
sp_relative_shift_uxn_opcodes_h_l1352_c30_f740_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6cf6
BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6cf6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6cf6_left,
BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6cf6_right,
BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6cf6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1354_c7_e1bb
result_is_sp_shift_MUX_uxn_opcodes_h_l1354_c7_e1bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1354_c7_e1bb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1354_c7_e1bb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1354_c7_e1bb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1354_c7_e1bb_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1354_c7_e1bb
result_u16_value_MUX_uxn_opcodes_h_l1354_c7_e1bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1354_c7_e1bb_cond,
result_u16_value_MUX_uxn_opcodes_h_l1354_c7_e1bb_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1354_c7_e1bb_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1354_c7_e1bb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_e1bb
result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_e1bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_e1bb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_e1bb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_e1bb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_e1bb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1354_c7_e1bb
result_u8_value_MUX_uxn_opcodes_h_l1354_c7_e1bb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1354_c7_e1bb_cond,
result_u8_value_MUX_uxn_opcodes_h_l1354_c7_e1bb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1354_c7_e1bb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1354_c7_e1bb_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1354_c7_e1bb
result_is_ram_write_MUX_uxn_opcodes_h_l1354_c7_e1bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1354_c7_e1bb_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1354_c7_e1bb_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1354_c7_e1bb_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1354_c7_e1bb_return_output);

-- t8_MUX_uxn_opcodes_h_l1354_c7_e1bb
t8_MUX_uxn_opcodes_h_l1354_c7_e1bb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1354_c7_e1bb_cond,
t8_MUX_uxn_opcodes_h_l1354_c7_e1bb_iftrue,
t8_MUX_uxn_opcodes_h_l1354_c7_e1bb_iffalse,
t8_MUX_uxn_opcodes_h_l1354_c7_e1bb_return_output);

-- n8_MUX_uxn_opcodes_h_l1354_c7_e1bb
n8_MUX_uxn_opcodes_h_l1354_c7_e1bb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1354_c7_e1bb_cond,
n8_MUX_uxn_opcodes_h_l1354_c7_e1bb_iftrue,
n8_MUX_uxn_opcodes_h_l1354_c7_e1bb_iffalse,
n8_MUX_uxn_opcodes_h_l1354_c7_e1bb_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1356_c18_4192
CONST_SR_8_uxn_opcodes_h_l1356_c18_4192 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1356_c18_4192_x,
CONST_SR_8_uxn_opcodes_h_l1356_c18_4192_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1362_c11_187d
BIN_OP_EQ_uxn_opcodes_h_l1362_c11_187d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1362_c11_187d_left,
BIN_OP_EQ_uxn_opcodes_h_l1362_c11_187d_right,
BIN_OP_EQ_uxn_opcodes_h_l1362_c11_187d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1362_c7_b8fb
result_is_opc_done_MUX_uxn_opcodes_h_l1362_c7_b8fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1362_c7_b8fb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1362_c7_b8fb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1362_c7_b8fb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1362_c7_b8fb_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1362_c7_b8fb
result_is_ram_write_MUX_uxn_opcodes_h_l1362_c7_b8fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1362_c7_b8fb_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1362_c7_b8fb_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1362_c7_b8fb_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1362_c7_b8fb_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1341_c6_a181_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1341_c2_9248_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_9248_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1341_c2_9248_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_9248_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_9248_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c2_9248_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1341_c2_9248_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1341_c2_9248_return_output,
 t8_MUX_uxn_opcodes_h_l1341_c2_9248_return_output,
 n8_MUX_uxn_opcodes_h_l1341_c2_9248_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1349_c11_928e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c7_9111_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1349_c7_9111_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1349_c7_9111_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_9111_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1349_c7_9111_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c7_9111_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1349_c7_9111_return_output,
 t8_MUX_uxn_opcodes_h_l1349_c7_9111_return_output,
 n8_MUX_uxn_opcodes_h_l1349_c7_9111_return_output,
 sp_relative_shift_uxn_opcodes_h_l1352_c30_f740_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6cf6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1354_c7_e1bb_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1354_c7_e1bb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_e1bb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1354_c7_e1bb_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1354_c7_e1bb_return_output,
 t8_MUX_uxn_opcodes_h_l1354_c7_e1bb_return_output,
 n8_MUX_uxn_opcodes_h_l1354_c7_e1bb_return_output,
 CONST_SR_8_uxn_opcodes_h_l1356_c18_4192_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1362_c11_187d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1362_c7_b8fb_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1362_c7_b8fb_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c6_a181_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c6_a181_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c6_a181_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1341_c2_9248_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1341_c2_9248_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1349_c7_9111_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1341_c2_9248_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1341_c2_9248_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_9248_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_9248_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_9111_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_9248_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_9248_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1341_c2_9248_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1341_c2_9248_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1349_c7_9111_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1341_c2_9248_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1341_c2_9248_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_9248_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_9248_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c7_9111_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_9248_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_9248_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_9248_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1346_c3_8f21 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_9248_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1341_c2_9248_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_9248_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_9248_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c2_9248_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c2_9248_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c7_9111_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c2_9248_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c2_9248_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1341_c2_9248_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1341_c2_9248_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1349_c7_9111_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1341_c2_9248_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1341_c2_9248_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1341_c2_9248_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1341_c2_9248_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1349_c7_9111_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1341_c2_9248_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1341_c2_9248_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1341_c2_9248_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1341_c2_9248_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1349_c7_9111_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1341_c2_9248_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1341_c2_9248_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1341_c2_9248_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1341_c2_9248_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1349_c7_9111_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1341_c2_9248_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1341_c2_9248_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1349_c11_928e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1349_c11_928e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1349_c11_928e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c7_9111_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c7_9111_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1354_c7_e1bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c7_9111_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1349_c7_9111_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1349_c7_9111_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1354_c7_e1bb_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1349_c7_9111_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1349_c7_9111_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1349_c7_9111_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l1349_c7_9111_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1349_c7_9111_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_9111_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_9111_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_e1bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_9111_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1349_c7_9111_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1349_c7_9111_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1354_c7_e1bb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1349_c7_9111_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c7_9111_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c7_9111_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c7_9111_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1349_c7_9111_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1349_c7_9111_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1354_c7_e1bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1349_c7_9111_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1349_c7_9111_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1349_c7_9111_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1354_c7_e1bb_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1349_c7_9111_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1349_c7_9111_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1349_c7_9111_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1354_c7_e1bb_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1349_c7_9111_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1352_c30_f740_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1352_c30_f740_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1352_c30_f740_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1352_c30_f740_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6cf6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6cf6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6cf6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1354_c7_e1bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1354_c7_e1bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1354_c7_e1bb_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1354_c7_e1bb_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1354_c7_e1bb_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1354_c7_e1bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_e1bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_e1bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1362_c7_b8fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_e1bb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1354_c7_e1bb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1354_c7_e1bb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1354_c7_e1bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1354_c7_e1bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1354_c7_e1bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1362_c7_b8fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1354_c7_e1bb_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1354_c7_e1bb_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1354_c7_e1bb_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1354_c7_e1bb_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1354_c7_e1bb_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1354_c7_e1bb_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1354_c7_e1bb_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1355_c8_4984_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1356_c18_4192_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1356_c18_4192_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1356_c8_1110_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1359_c22_c529_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1362_c11_187d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1362_c11_187d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1362_c11_187d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1362_c7_b8fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1362_c7_b8fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1362_c7_b8fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1362_c7_b8fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1362_c7_b8fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1362_c7_b8fb_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1354_l1349_l1341_DUPLICATE_23ac_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1354_l1349_l1341_DUPLICATE_c0b3_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1349_l1341_DUPLICATE_525c_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1354_l1341_DUPLICATE_0eeb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1362_l1349_l1341_DUPLICATE_77e1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1362_l1354_l1349_DUPLICATE_0a63_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c7f2_uxn_opcodes_h_l1337_l1367_DUPLICATE_ac89_return_output : opcode_result_t;
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
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1354_c7_e1bb_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_9248_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c6_a181_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1354_c7_e1bb_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1341_c2_9248_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1362_c11_187d_right := to_unsigned(3, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1362_c7_b8fb_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1346_c3_8f21 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_9248_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1346_c3_8f21;
     VAR_sp_relative_shift_uxn_opcodes_h_l1352_c30_f740_y := resize(to_signed(-2, 3), 4);
     VAR_sp_relative_shift_uxn_opcodes_h_l1352_c30_f740_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6cf6_right := to_unsigned(2, 2);
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1349_c7_9111_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c7_9111_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1362_c7_b8fb_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1349_c11_928e_right := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1352_c30_f740_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l1341_c2_9248_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1349_c7_9111_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1354_c7_e1bb_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c6_a181_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1349_c11_928e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6cf6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1362_c11_187d_left := VAR_phase;
     VAR_CONST_SR_8_uxn_opcodes_h_l1356_c18_4192_x := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1341_c2_9248_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1349_c7_9111_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1354_c7_e1bb_iffalse := t8;
     -- CONST_SR_8[uxn_opcodes_h_l1356_c18_4192] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1356_c18_4192_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1356_c18_4192_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1356_c18_4192_return_output := CONST_SR_8_uxn_opcodes_h_l1356_c18_4192_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1355_c8_4984] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1355_c8_4984_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_previous_stack_read);

     -- sp_relative_shift[uxn_opcodes_h_l1352_c30_f740] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1352_c30_f740_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1352_c30_f740_ins;
     sp_relative_shift_uxn_opcodes_h_l1352_c30_f740_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1352_c30_f740_x;
     sp_relative_shift_uxn_opcodes_h_l1352_c30_f740_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1352_c30_f740_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1352_c30_f740_return_output := sp_relative_shift_uxn_opcodes_h_l1352_c30_f740_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1354_c11_6cf6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6cf6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6cf6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6cf6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6cf6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6cf6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6cf6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1341_c6_a181] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1341_c6_a181_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c6_a181_left;
     BIN_OP_EQ_uxn_opcodes_h_l1341_c6_a181_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c6_a181_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c6_a181_return_output := BIN_OP_EQ_uxn_opcodes_h_l1341_c6_a181_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1354_l1349_l1341_DUPLICATE_23ac LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1354_l1349_l1341_DUPLICATE_23ac_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1362_c11_187d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1362_c11_187d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1362_c11_187d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1362_c11_187d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1362_c11_187d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1362_c11_187d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1362_c11_187d_return_output;

     -- result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d[uxn_opcodes_h_l1349_c7_9111] LATENCY=0
     VAR_result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l1349_c7_9111_return_output := result.is_stack_operation_16bit;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1354_l1341_DUPLICATE_0eeb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1354_l1341_DUPLICATE_0eeb_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1362_l1354_l1349_DUPLICATE_0a63 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1362_l1354_l1349_DUPLICATE_0a63_return_output := result.is_opc_done;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1341_c2_9248] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1341_c2_9248_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1354_l1349_l1341_DUPLICATE_c0b3 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1354_l1349_l1341_DUPLICATE_c0b3_return_output := result.u8_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1349_l1341_DUPLICATE_525c LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1349_l1341_DUPLICATE_525c_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1362_l1349_l1341_DUPLICATE_77e1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1362_l1349_l1341_DUPLICATE_77e1_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1349_c11_928e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1349_c11_928e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1349_c11_928e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1349_c11_928e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1349_c11_928e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1349_c11_928e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1349_c11_928e_return_output;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l1341_c2_9248_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c6_a181_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_9248_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c6_a181_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1341_c2_9248_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c6_a181_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c2_9248_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c6_a181_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1341_c2_9248_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c6_a181_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_9248_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c6_a181_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_9248_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c6_a181_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1341_c2_9248_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c6_a181_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1341_c2_9248_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c6_a181_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1341_c2_9248_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c6_a181_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1349_c7_9111_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1349_c11_928e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_9111_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1349_c11_928e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1349_c7_9111_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1349_c11_928e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c7_9111_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1349_c11_928e_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1349_c7_9111_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1349_c11_928e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c7_9111_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1349_c11_928e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1349_c7_9111_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1349_c11_928e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1349_c7_9111_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1349_c11_928e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1349_c7_9111_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1349_c11_928e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1354_c7_e1bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6cf6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_e1bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6cf6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1354_c7_e1bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6cf6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1354_c7_e1bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6cf6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1354_c7_e1bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6cf6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1354_c7_e1bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6cf6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1354_c7_e1bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1354_c11_6cf6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1362_c7_b8fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1362_c11_187d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1362_c7_b8fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1362_c11_187d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1354_c7_e1bb_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1355_c8_4984_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_9248_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1349_l1341_DUPLICATE_525c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c7_9111_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1349_l1341_DUPLICATE_525c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1341_c2_9248_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1354_l1349_l1341_DUPLICATE_23ac_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1349_c7_9111_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1354_l1349_l1341_DUPLICATE_23ac_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1354_c7_e1bb_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1354_l1349_l1341_DUPLICATE_23ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_9111_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1362_l1354_l1349_DUPLICATE_0a63_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_e1bb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1362_l1354_l1349_DUPLICATE_0a63_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1362_c7_b8fb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1362_l1354_l1349_DUPLICATE_0a63_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1341_c2_9248_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1362_l1349_l1341_DUPLICATE_77e1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1349_c7_9111_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1362_l1349_l1341_DUPLICATE_77e1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1362_c7_b8fb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1362_l1349_l1341_DUPLICATE_77e1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c2_9248_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1354_l1341_DUPLICATE_0eeb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1354_c7_e1bb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1354_l1341_DUPLICATE_0eeb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1341_c2_9248_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1354_l1349_l1341_DUPLICATE_c0b3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1349_c7_9111_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1354_l1349_l1341_DUPLICATE_c0b3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1354_c7_e1bb_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1354_l1349_l1341_DUPLICATE_c0b3_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1349_c7_9111_iffalse := VAR_result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l1349_c7_9111_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_9248_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1341_c2_9248_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c7_9111_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1352_c30_f740_return_output;
     -- CAST_TO_uint16_t[uxn_opcodes_h_l1359_c22_c529] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1359_c22_c529_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1355_c8_4984_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1362_c7_b8fb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1362_c7_b8fb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1362_c7_b8fb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1362_c7_b8fb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1362_c7_b8fb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1362_c7_b8fb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1362_c7_b8fb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1362_c7_b8fb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1362_c7_b8fb_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1362_c7_b8fb] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1362_c7_b8fb_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1362_c7_b8fb_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1362_c7_b8fb_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1362_c7_b8fb_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1362_c7_b8fb_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1362_c7_b8fb_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1362_c7_b8fb_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1362_c7_b8fb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1349_c7_9111] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c7_9111_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c7_9111_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c7_9111_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c7_9111_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c7_9111_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c7_9111_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c7_9111_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c7_9111_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1349_c7_9111] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1349_c7_9111_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1349_c7_9111_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1349_c7_9111_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1349_c7_9111_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1349_c7_9111_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1349_c7_9111_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1349_c7_9111_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1349_c7_9111_return_output;

     -- t8_MUX[uxn_opcodes_h_l1354_c7_e1bb] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1354_c7_e1bb_cond <= VAR_t8_MUX_uxn_opcodes_h_l1354_c7_e1bb_cond;
     t8_MUX_uxn_opcodes_h_l1354_c7_e1bb_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1354_c7_e1bb_iftrue;
     t8_MUX_uxn_opcodes_h_l1354_c7_e1bb_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1354_c7_e1bb_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1354_c7_e1bb_return_output := t8_MUX_uxn_opcodes_h_l1354_c7_e1bb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1341_c2_9248] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_9248_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_9248_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_9248_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_9248_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_9248_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_9248_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_9248_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_9248_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1356_c8_1110] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1356_c8_1110_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1356_c18_4192_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1354_c7_e1bb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1354_c7_e1bb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1354_c7_e1bb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1354_c7_e1bb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1354_c7_e1bb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1354_c7_e1bb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1354_c7_e1bb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1354_c7_e1bb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1354_c7_e1bb_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1354_c7_e1bb_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1359_c22_c529_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1354_c7_e1bb_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1356_c8_1110_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1354_c7_e1bb_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1356_c8_1110_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_e1bb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1362_c7_b8fb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1354_c7_e1bb_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1362_c7_b8fb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c7_9111_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1354_c7_e1bb_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1341_c2_9248_iffalse := VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1349_c7_9111_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_9248_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1349_c7_9111_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1349_c7_9111_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1354_c7_e1bb_return_output;
     -- n8_MUX[uxn_opcodes_h_l1354_c7_e1bb] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1354_c7_e1bb_cond <= VAR_n8_MUX_uxn_opcodes_h_l1354_c7_e1bb_cond;
     n8_MUX_uxn_opcodes_h_l1354_c7_e1bb_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1354_c7_e1bb_iftrue;
     n8_MUX_uxn_opcodes_h_l1354_c7_e1bb_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1354_c7_e1bb_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1354_c7_e1bb_return_output := n8_MUX_uxn_opcodes_h_l1354_c7_e1bb_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1354_c7_e1bb] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1354_c7_e1bb_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1354_c7_e1bb_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1354_c7_e1bb_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1354_c7_e1bb_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1354_c7_e1bb_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1354_c7_e1bb_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1354_c7_e1bb_return_output := result_u16_value_MUX_uxn_opcodes_h_l1354_c7_e1bb_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1354_c7_e1bb] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1354_c7_e1bb_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1354_c7_e1bb_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1354_c7_e1bb_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1354_c7_e1bb_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1354_c7_e1bb_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1354_c7_e1bb_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1354_c7_e1bb_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1354_c7_e1bb_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1341_c2_9248] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1341_c2_9248_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1341_c2_9248_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1341_c2_9248_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1341_c2_9248_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1341_c2_9248_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1341_c2_9248_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1341_c2_9248_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1341_c2_9248_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1349_c7_9111] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c7_9111_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c7_9111_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c7_9111_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c7_9111_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c7_9111_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c7_9111_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c7_9111_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c7_9111_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1341_c2_9248] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_9248_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_9248_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_9248_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_9248_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_9248_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_9248_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_9248_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_9248_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1354_c7_e1bb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1354_c7_e1bb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1354_c7_e1bb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1354_c7_e1bb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1354_c7_e1bb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1354_c7_e1bb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1354_c7_e1bb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1354_c7_e1bb_return_output := result_u8_value_MUX_uxn_opcodes_h_l1354_c7_e1bb_return_output;

     -- t8_MUX[uxn_opcodes_h_l1349_c7_9111] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1349_c7_9111_cond <= VAR_t8_MUX_uxn_opcodes_h_l1349_c7_9111_cond;
     t8_MUX_uxn_opcodes_h_l1349_c7_9111_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1349_c7_9111_iftrue;
     t8_MUX_uxn_opcodes_h_l1349_c7_9111_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1349_c7_9111_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1349_c7_9111_return_output := t8_MUX_uxn_opcodes_h_l1349_c7_9111_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1354_c7_e1bb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_e1bb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_e1bb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_e1bb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_e1bb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_e1bb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_e1bb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_e1bb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_e1bb_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l1349_c7_9111_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1354_c7_e1bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_9111_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1354_c7_e1bb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1349_c7_9111_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1354_c7_e1bb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c2_9248_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1349_c7_9111_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1349_c7_9111_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1354_c7_e1bb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1349_c7_9111_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1354_c7_e1bb_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1341_c2_9248_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1349_c7_9111_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1349_c7_9111] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_9111_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_9111_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_9111_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_9111_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_9111_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_9111_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_9111_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_9111_return_output;

     -- t8_MUX[uxn_opcodes_h_l1341_c2_9248] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1341_c2_9248_cond <= VAR_t8_MUX_uxn_opcodes_h_l1341_c2_9248_cond;
     t8_MUX_uxn_opcodes_h_l1341_c2_9248_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1341_c2_9248_iftrue;
     t8_MUX_uxn_opcodes_h_l1341_c2_9248_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1341_c2_9248_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1341_c2_9248_return_output := t8_MUX_uxn_opcodes_h_l1341_c2_9248_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1349_c7_9111] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1349_c7_9111_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1349_c7_9111_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1349_c7_9111_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1349_c7_9111_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1349_c7_9111_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1349_c7_9111_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1349_c7_9111_return_output := result_u16_value_MUX_uxn_opcodes_h_l1349_c7_9111_return_output;

     -- n8_MUX[uxn_opcodes_h_l1349_c7_9111] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1349_c7_9111_cond <= VAR_n8_MUX_uxn_opcodes_h_l1349_c7_9111_cond;
     n8_MUX_uxn_opcodes_h_l1349_c7_9111_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1349_c7_9111_iftrue;
     n8_MUX_uxn_opcodes_h_l1349_c7_9111_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1349_c7_9111_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1349_c7_9111_return_output := n8_MUX_uxn_opcodes_h_l1349_c7_9111_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1349_c7_9111] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1349_c7_9111_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1349_c7_9111_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1349_c7_9111_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1349_c7_9111_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1349_c7_9111_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1349_c7_9111_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1349_c7_9111_return_output := result_u8_value_MUX_uxn_opcodes_h_l1349_c7_9111_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1349_c7_9111] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1349_c7_9111_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1349_c7_9111_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1349_c7_9111_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1349_c7_9111_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1349_c7_9111_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1349_c7_9111_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1349_c7_9111_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1349_c7_9111_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1341_c2_9248] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c2_9248_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c2_9248_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c2_9248_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c2_9248_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c2_9248_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c2_9248_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c2_9248_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c2_9248_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1341_c2_9248_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1349_c7_9111_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_9248_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1349_c7_9111_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1341_c2_9248_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1349_c7_9111_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1341_c2_9248_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1349_c7_9111_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1341_c2_9248_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1349_c7_9111_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1341_c2_9248_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1341_c2_9248] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1341_c2_9248_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1341_c2_9248_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1341_c2_9248_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1341_c2_9248_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1341_c2_9248_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1341_c2_9248_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1341_c2_9248_return_output := result_u8_value_MUX_uxn_opcodes_h_l1341_c2_9248_return_output;

     -- n8_MUX[uxn_opcodes_h_l1341_c2_9248] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1341_c2_9248_cond <= VAR_n8_MUX_uxn_opcodes_h_l1341_c2_9248_cond;
     n8_MUX_uxn_opcodes_h_l1341_c2_9248_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1341_c2_9248_iftrue;
     n8_MUX_uxn_opcodes_h_l1341_c2_9248_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1341_c2_9248_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1341_c2_9248_return_output := n8_MUX_uxn_opcodes_h_l1341_c2_9248_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1341_c2_9248] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_9248_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_9248_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_9248_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_9248_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_9248_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_9248_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_9248_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_9248_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1341_c2_9248] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1341_c2_9248_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1341_c2_9248_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1341_c2_9248_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1341_c2_9248_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1341_c2_9248_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1341_c2_9248_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1341_c2_9248_return_output := result_u16_value_MUX_uxn_opcodes_h_l1341_c2_9248_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1341_c2_9248] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1341_c2_9248_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1341_c2_9248_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1341_c2_9248_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1341_c2_9248_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1341_c2_9248_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1341_c2_9248_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1341_c2_9248_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1341_c2_9248_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1341_c2_9248_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c7f2_uxn_opcodes_h_l1337_l1367_DUPLICATE_ac89 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c7f2_uxn_opcodes_h_l1337_l1367_DUPLICATE_ac89_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c7f2(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1341_c2_9248_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1341_c2_9248_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1341_c2_9248_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1341_c2_9248_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c2_9248_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c2_9248_return_output,
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1341_c2_9248_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1341_c2_9248_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c7f2_uxn_opcodes_h_l1337_l1367_DUPLICATE_ac89_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c7f2_uxn_opcodes_h_l1337_l1367_DUPLICATE_ac89_return_output;
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
