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
-- Submodules: 32
entity lit_0CLK_e573058b is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lit_0CLK_e573058b;
architecture arch of lit_0CLK_e573058b is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l189_c6_4a92]
signal BIN_OP_EQ_uxn_opcodes_h_l189_c6_4a92_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l189_c6_4a92_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l189_c6_4a92_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l189_c1_6556]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l189_c1_6556_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l189_c1_6556_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l189_c1_6556_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l189_c1_6556_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l189_c2_3317]
signal result_is_stack_write_MUX_uxn_opcodes_h_l189_c2_3317_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l189_c2_3317_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l189_c2_3317_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l189_c2_3317_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l189_c2_3317]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l189_c2_3317_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l189_c2_3317_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l189_c2_3317_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l189_c2_3317_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l189_c2_3317]
signal result_ram_addr_MUX_uxn_opcodes_h_l189_c2_3317_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l189_c2_3317_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l189_c2_3317_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l189_c2_3317_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l189_c2_3317]
signal result_pc_MUX_uxn_opcodes_h_l189_c2_3317_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l189_c2_3317_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l189_c2_3317_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l189_c2_3317_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l189_c2_3317]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l189_c2_3317_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l189_c2_3317_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l189_c2_3317_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l189_c2_3317_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l189_c2_3317]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l189_c2_3317_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l189_c2_3317_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l189_c2_3317_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l189_c2_3317_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l189_c2_3317]
signal result_is_opc_done_MUX_uxn_opcodes_h_l189_c2_3317_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l189_c2_3317_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l189_c2_3317_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l189_c2_3317_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l189_c2_3317]
signal result_stack_value_MUX_uxn_opcodes_h_l189_c2_3317_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l189_c2_3317_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l189_c2_3317_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l189_c2_3317_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l189_c2_3317]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l189_c2_3317_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l189_c2_3317_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l189_c2_3317_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l189_c2_3317_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l190_c3_8a40[uxn_opcodes_h_l190_c3_8a40]
signal printf_uxn_opcodes_h_l190_c3_8a40_uxn_opcodes_h_l190_c3_8a40_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l196_c11_b145]
signal BIN_OP_EQ_uxn_opcodes_h_l196_c11_b145_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l196_c11_b145_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l196_c11_b145_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l196_c7_574d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l196_c7_574d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l196_c7_574d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l196_c7_574d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l196_c7_574d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l196_c7_574d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l196_c7_574d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l196_c7_574d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l196_c7_574d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l196_c7_574d_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l196_c7_574d]
signal result_ram_addr_MUX_uxn_opcodes_h_l196_c7_574d_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l196_c7_574d_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l196_c7_574d_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l196_c7_574d_return_output : unsigned(15 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l196_c7_574d]
signal result_pc_MUX_uxn_opcodes_h_l196_c7_574d_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l196_c7_574d_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l196_c7_574d_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l196_c7_574d_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l196_c7_574d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l196_c7_574d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l196_c7_574d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l196_c7_574d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l196_c7_574d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l196_c7_574d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l196_c7_574d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l196_c7_574d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l196_c7_574d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l196_c7_574d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l196_c7_574d]
signal result_stack_value_MUX_uxn_opcodes_h_l196_c7_574d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l196_c7_574d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l196_c7_574d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l196_c7_574d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l196_c7_574d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l196_c7_574d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l196_c7_574d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l196_c7_574d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l196_c7_574d_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l200_c15_afd6]
signal BIN_OP_PLUS_uxn_opcodes_h_l200_c15_afd6_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l200_c15_afd6_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l200_c15_afd6_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l202_c11_b639]
signal BIN_OP_EQ_uxn_opcodes_h_l202_c11_b639_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l202_c11_b639_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l202_c11_b639_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l202_c7_7e58]
signal result_is_stack_write_MUX_uxn_opcodes_h_l202_c7_7e58_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l202_c7_7e58_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l202_c7_7e58_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l202_c7_7e58_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l202_c7_7e58]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l202_c7_7e58_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l202_c7_7e58_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l202_c7_7e58_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l202_c7_7e58_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l202_c7_7e58]
signal result_is_opc_done_MUX_uxn_opcodes_h_l202_c7_7e58_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l202_c7_7e58_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l202_c7_7e58_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l202_c7_7e58_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l202_c7_7e58]
signal result_stack_value_MUX_uxn_opcodes_h_l202_c7_7e58_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l202_c7_7e58_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l202_c7_7e58_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l202_c7_7e58_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l202_c7_7e58]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l202_c7_7e58_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l202_c7_7e58_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l202_c7_7e58_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l202_c7_7e58_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l208_c11_550e]
signal BIN_OP_EQ_uxn_opcodes_h_l208_c11_550e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l208_c11_550e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l208_c11_550e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l208_c7_cc12]
signal result_is_stack_write_MUX_uxn_opcodes_h_l208_c7_cc12_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l208_c7_cc12_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l208_c7_cc12_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l208_c7_cc12_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l208_c7_cc12]
signal result_is_opc_done_MUX_uxn_opcodes_h_l208_c7_cc12_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l208_c7_cc12_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l208_c7_cc12_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l208_c7_cc12_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_ac32( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.ram_addr := ref_toks_3;
      base.pc := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_sp_shift := ref_toks_6;
      base.is_opc_done := ref_toks_7;
      base.stack_value := ref_toks_8;
      base.is_pc_updated := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l189_c6_4a92
BIN_OP_EQ_uxn_opcodes_h_l189_c6_4a92 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l189_c6_4a92_left,
BIN_OP_EQ_uxn_opcodes_h_l189_c6_4a92_right,
BIN_OP_EQ_uxn_opcodes_h_l189_c6_4a92_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l189_c1_6556
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l189_c1_6556 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l189_c1_6556_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l189_c1_6556_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l189_c1_6556_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l189_c1_6556_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l189_c2_3317
result_is_stack_write_MUX_uxn_opcodes_h_l189_c2_3317 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l189_c2_3317_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l189_c2_3317_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l189_c2_3317_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l189_c2_3317_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l189_c2_3317
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l189_c2_3317 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l189_c2_3317_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l189_c2_3317_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l189_c2_3317_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l189_c2_3317_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l189_c2_3317
result_ram_addr_MUX_uxn_opcodes_h_l189_c2_3317 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l189_c2_3317_cond,
result_ram_addr_MUX_uxn_opcodes_h_l189_c2_3317_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l189_c2_3317_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l189_c2_3317_return_output);

-- result_pc_MUX_uxn_opcodes_h_l189_c2_3317
result_pc_MUX_uxn_opcodes_h_l189_c2_3317 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l189_c2_3317_cond,
result_pc_MUX_uxn_opcodes_h_l189_c2_3317_iftrue,
result_pc_MUX_uxn_opcodes_h_l189_c2_3317_iffalse,
result_pc_MUX_uxn_opcodes_h_l189_c2_3317_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l189_c2_3317
result_sp_relative_shift_MUX_uxn_opcodes_h_l189_c2_3317 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l189_c2_3317_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l189_c2_3317_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l189_c2_3317_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l189_c2_3317_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l189_c2_3317
result_is_sp_shift_MUX_uxn_opcodes_h_l189_c2_3317 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l189_c2_3317_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l189_c2_3317_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l189_c2_3317_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l189_c2_3317_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l189_c2_3317
result_is_opc_done_MUX_uxn_opcodes_h_l189_c2_3317 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l189_c2_3317_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l189_c2_3317_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l189_c2_3317_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l189_c2_3317_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l189_c2_3317
result_stack_value_MUX_uxn_opcodes_h_l189_c2_3317 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l189_c2_3317_cond,
result_stack_value_MUX_uxn_opcodes_h_l189_c2_3317_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l189_c2_3317_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l189_c2_3317_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l189_c2_3317
result_is_pc_updated_MUX_uxn_opcodes_h_l189_c2_3317 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l189_c2_3317_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l189_c2_3317_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l189_c2_3317_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l189_c2_3317_return_output);

-- printf_uxn_opcodes_h_l190_c3_8a40_uxn_opcodes_h_l190_c3_8a40
printf_uxn_opcodes_h_l190_c3_8a40_uxn_opcodes_h_l190_c3_8a40 : entity work.printf_uxn_opcodes_h_l190_c3_8a40_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l190_c3_8a40_uxn_opcodes_h_l190_c3_8a40_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l196_c11_b145
BIN_OP_EQ_uxn_opcodes_h_l196_c11_b145 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l196_c11_b145_left,
BIN_OP_EQ_uxn_opcodes_h_l196_c11_b145_right,
BIN_OP_EQ_uxn_opcodes_h_l196_c11_b145_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l196_c7_574d
result_is_stack_write_MUX_uxn_opcodes_h_l196_c7_574d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l196_c7_574d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l196_c7_574d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l196_c7_574d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l196_c7_574d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l196_c7_574d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l196_c7_574d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l196_c7_574d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l196_c7_574d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l196_c7_574d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l196_c7_574d_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l196_c7_574d
result_ram_addr_MUX_uxn_opcodes_h_l196_c7_574d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l196_c7_574d_cond,
result_ram_addr_MUX_uxn_opcodes_h_l196_c7_574d_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l196_c7_574d_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l196_c7_574d_return_output);

-- result_pc_MUX_uxn_opcodes_h_l196_c7_574d
result_pc_MUX_uxn_opcodes_h_l196_c7_574d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l196_c7_574d_cond,
result_pc_MUX_uxn_opcodes_h_l196_c7_574d_iftrue,
result_pc_MUX_uxn_opcodes_h_l196_c7_574d_iffalse,
result_pc_MUX_uxn_opcodes_h_l196_c7_574d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l196_c7_574d
result_is_pc_updated_MUX_uxn_opcodes_h_l196_c7_574d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l196_c7_574d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l196_c7_574d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l196_c7_574d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l196_c7_574d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l196_c7_574d
result_is_opc_done_MUX_uxn_opcodes_h_l196_c7_574d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l196_c7_574d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l196_c7_574d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l196_c7_574d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l196_c7_574d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l196_c7_574d
result_stack_value_MUX_uxn_opcodes_h_l196_c7_574d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l196_c7_574d_cond,
result_stack_value_MUX_uxn_opcodes_h_l196_c7_574d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l196_c7_574d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l196_c7_574d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l196_c7_574d
result_is_sp_shift_MUX_uxn_opcodes_h_l196_c7_574d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l196_c7_574d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l196_c7_574d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l196_c7_574d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l196_c7_574d_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l200_c15_afd6
BIN_OP_PLUS_uxn_opcodes_h_l200_c15_afd6 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l200_c15_afd6_left,
BIN_OP_PLUS_uxn_opcodes_h_l200_c15_afd6_right,
BIN_OP_PLUS_uxn_opcodes_h_l200_c15_afd6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l202_c11_b639
BIN_OP_EQ_uxn_opcodes_h_l202_c11_b639 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l202_c11_b639_left,
BIN_OP_EQ_uxn_opcodes_h_l202_c11_b639_right,
BIN_OP_EQ_uxn_opcodes_h_l202_c11_b639_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l202_c7_7e58
result_is_stack_write_MUX_uxn_opcodes_h_l202_c7_7e58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l202_c7_7e58_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l202_c7_7e58_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l202_c7_7e58_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l202_c7_7e58_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l202_c7_7e58
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l202_c7_7e58 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l202_c7_7e58_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l202_c7_7e58_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l202_c7_7e58_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l202_c7_7e58_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l202_c7_7e58
result_is_opc_done_MUX_uxn_opcodes_h_l202_c7_7e58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l202_c7_7e58_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l202_c7_7e58_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l202_c7_7e58_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l202_c7_7e58_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l202_c7_7e58
result_stack_value_MUX_uxn_opcodes_h_l202_c7_7e58 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l202_c7_7e58_cond,
result_stack_value_MUX_uxn_opcodes_h_l202_c7_7e58_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l202_c7_7e58_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l202_c7_7e58_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l202_c7_7e58
result_is_pc_updated_MUX_uxn_opcodes_h_l202_c7_7e58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l202_c7_7e58_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l202_c7_7e58_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l202_c7_7e58_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l202_c7_7e58_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l208_c11_550e
BIN_OP_EQ_uxn_opcodes_h_l208_c11_550e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l208_c11_550e_left,
BIN_OP_EQ_uxn_opcodes_h_l208_c11_550e_right,
BIN_OP_EQ_uxn_opcodes_h_l208_c11_550e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l208_c7_cc12
result_is_stack_write_MUX_uxn_opcodes_h_l208_c7_cc12 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l208_c7_cc12_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l208_c7_cc12_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l208_c7_cc12_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l208_c7_cc12_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l208_c7_cc12
result_is_opc_done_MUX_uxn_opcodes_h_l208_c7_cc12 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l208_c7_cc12_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l208_c7_cc12_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l208_c7_cc12_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l208_c7_cc12_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 pc,
 previous_ram_read,
 -- Registers
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l189_c6_4a92_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l189_c1_6556_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l189_c2_3317_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l189_c2_3317_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l189_c2_3317_return_output,
 result_pc_MUX_uxn_opcodes_h_l189_c2_3317_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l189_c2_3317_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l189_c2_3317_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l189_c2_3317_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l189_c2_3317_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l189_c2_3317_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l196_c11_b145_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l196_c7_574d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l196_c7_574d_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l196_c7_574d_return_output,
 result_pc_MUX_uxn_opcodes_h_l196_c7_574d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l196_c7_574d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l196_c7_574d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l196_c7_574d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l196_c7_574d_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l200_c15_afd6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l202_c11_b639_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l202_c7_7e58_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l202_c7_7e58_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l202_c7_7e58_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l202_c7_7e58_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l202_c7_7e58_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l208_c11_550e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l208_c7_cc12_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l208_c7_cc12_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l189_c6_4a92_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l189_c6_4a92_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l189_c6_4a92_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l189_c1_6556_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l189_c1_6556_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l189_c1_6556_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l189_c1_6556_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l189_c2_3317_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l189_c2_3317_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l196_c7_574d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l189_c2_3317_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l189_c2_3317_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l189_c2_3317_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l189_c2_3317_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l196_c7_574d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l189_c2_3317_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l189_c2_3317_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l189_c2_3317_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l189_c2_3317_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l196_c7_574d_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l189_c2_3317_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l189_c2_3317_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l189_c2_3317_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l189_c2_3317_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l196_c7_574d_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l189_c2_3317_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l189_c2_3317_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l189_c2_3317_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l192_c3_1a0a : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l189_c2_3317_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l189_c2_3317_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l189_c2_3317_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l189_c2_3317_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l189_c2_3317_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l189_c2_3317_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l196_c7_574d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l189_c2_3317_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l189_c2_3317_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l189_c2_3317_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l189_c2_3317_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l196_c7_574d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l189_c2_3317_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l189_c2_3317_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l189_c2_3317_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l189_c2_3317_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l196_c7_574d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l189_c2_3317_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l189_c2_3317_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l189_c2_3317_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l189_c2_3317_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l196_c7_574d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l189_c2_3317_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l189_c2_3317_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l190_c3_8a40_uxn_opcodes_h_l190_c3_8a40_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l196_c11_b145_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l196_c11_b145_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l196_c11_b145_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l196_c7_574d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l196_c7_574d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l202_c7_7e58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l196_c7_574d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l196_c7_574d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l196_c7_574d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l202_c7_7e58_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l196_c7_574d_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l196_c7_574d_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l196_c7_574d_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l196_c7_574d_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l196_c7_574d_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l196_c7_574d_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l200_c3_24ab : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l196_c7_574d_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l196_c7_574d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l196_c7_574d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l196_c7_574d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l202_c7_7e58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l196_c7_574d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l196_c7_574d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l196_c7_574d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l202_c7_7e58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l196_c7_574d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l196_c7_574d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l196_c7_574d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l202_c7_7e58_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l196_c7_574d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l196_c7_574d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l196_c7_574d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l196_c7_574d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l196_c7_574d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l200_c15_afd6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l200_c15_afd6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l200_c15_afd6_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l202_c11_b639_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l202_c11_b639_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l202_c11_b639_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l202_c7_7e58_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l202_c7_7e58_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l208_c7_cc12_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l202_c7_7e58_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l202_c7_7e58_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l205_c3_e875 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l202_c7_7e58_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l202_c7_7e58_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l202_c7_7e58_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l202_c7_7e58_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l208_c7_cc12_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l202_c7_7e58_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l202_c7_7e58_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l202_c7_7e58_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l202_c7_7e58_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l202_c7_7e58_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l202_c7_7e58_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l202_c7_7e58_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l208_c11_550e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l208_c11_550e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l208_c11_550e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l208_c7_cc12_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l208_c7_cc12_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l208_c7_cc12_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l208_c7_cc12_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l208_c7_cc12_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l208_c7_cc12_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l196_l189_l208_DUPLICATE_8374_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l196_l202_l189_DUPLICATE_fea4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l196_l189_DUPLICATE_3024_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l196_l202_l189_DUPLICATE_aa4c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l202_l189_DUPLICATE_1a11_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l196_l202_l208_DUPLICATE_78d1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ac32_uxn_opcodes_h_l213_l185_DUPLICATE_9278_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l196_c11_b145_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l202_c7_7e58_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l200_c15_afd6_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l208_c7_cc12_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l196_c7_574d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l202_c11_b639_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l189_c2_3317_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l189_c6_4a92_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l205_c3_e875 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l202_c7_7e58_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l205_c3_e875;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l192_c3_1a0a := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l189_c2_3317_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l192_c3_1a0a;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l189_c1_6556_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l208_c7_cc12_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l208_c11_550e_right := to_unsigned(3, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l202_c7_7e58_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l196_c7_574d_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l189_c2_3317_iftrue := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_pc := pc;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l189_c1_6556_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l200_c15_afd6_left := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l189_c2_3317_iftrue := VAR_pc;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l196_c7_574d_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l189_c6_4a92_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l196_c11_b145_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l202_c11_b639_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l208_c11_550e_left := VAR_phase;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l202_c7_7e58_iftrue := VAR_previous_ram_read;
     -- BIN_OP_EQ[uxn_opcodes_h_l202_c11_b639] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l202_c11_b639_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l202_c11_b639_left;
     BIN_OP_EQ_uxn_opcodes_h_l202_c11_b639_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l202_c11_b639_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l202_c11_b639_return_output := BIN_OP_EQ_uxn_opcodes_h_l202_c11_b639_return_output;

     -- result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l196_c7_574d] LATENCY=0
     VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l196_c7_574d_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l196_l189_DUPLICATE_3024 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l196_l189_DUPLICATE_3024_return_output := result.pc;

     -- result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d[uxn_opcodes_h_l196_c7_574d] LATENCY=0
     VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l196_c7_574d_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l196_c11_b145] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l196_c11_b145_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l196_c11_b145_left;
     BIN_OP_EQ_uxn_opcodes_h_l196_c11_b145_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l196_c11_b145_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l196_c11_b145_return_output := BIN_OP_EQ_uxn_opcodes_h_l196_c11_b145_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l196_l202_l189_DUPLICATE_fea4 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l196_l202_l189_DUPLICATE_fea4_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l196_l202_l189_DUPLICATE_aa4c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l196_l202_l189_DUPLICATE_aa4c_return_output := result.stack_value;

     -- BIN_OP_PLUS[uxn_opcodes_h_l200_c15_afd6] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l200_c15_afd6_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l200_c15_afd6_left;
     BIN_OP_PLUS_uxn_opcodes_h_l200_c15_afd6_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l200_c15_afd6_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l200_c15_afd6_return_output := BIN_OP_PLUS_uxn_opcodes_h_l200_c15_afd6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l189_c6_4a92] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l189_c6_4a92_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l189_c6_4a92_left;
     BIN_OP_EQ_uxn_opcodes_h_l189_c6_4a92_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l189_c6_4a92_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l189_c6_4a92_return_output := BIN_OP_EQ_uxn_opcodes_h_l189_c6_4a92_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l196_l189_l208_DUPLICATE_8374 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l196_l189_l208_DUPLICATE_8374_return_output := result.is_stack_write;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l189_c2_3317] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l189_c2_3317_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l202_l189_DUPLICATE_1a11 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l202_l189_DUPLICATE_1a11_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l196_l202_l208_DUPLICATE_78d1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l196_l202_l208_DUPLICATE_78d1_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l208_c11_550e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l208_c11_550e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l208_c11_550e_left;
     BIN_OP_EQ_uxn_opcodes_h_l208_c11_550e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l208_c11_550e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l208_c11_550e_return_output := BIN_OP_EQ_uxn_opcodes_h_l208_c11_550e_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l189_c1_6556_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l189_c6_4a92_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l189_c2_3317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l189_c6_4a92_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l189_c2_3317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l189_c6_4a92_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l189_c2_3317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l189_c6_4a92_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l189_c2_3317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l189_c6_4a92_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l189_c2_3317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l189_c6_4a92_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l189_c2_3317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l189_c6_4a92_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l189_c2_3317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l189_c6_4a92_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l189_c2_3317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l189_c6_4a92_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l189_c2_3317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l189_c6_4a92_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l196_c7_574d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l196_c11_b145_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l196_c7_574d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l196_c11_b145_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l196_c7_574d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l196_c11_b145_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l196_c7_574d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l196_c11_b145_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l196_c7_574d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l196_c11_b145_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l196_c7_574d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l196_c11_b145_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l196_c7_574d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l196_c11_b145_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l196_c7_574d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l196_c11_b145_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l202_c7_7e58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l202_c11_b639_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l202_c7_7e58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l202_c11_b639_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l202_c7_7e58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l202_c11_b639_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l202_c7_7e58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l202_c11_b639_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l202_c7_7e58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l202_c11_b639_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l208_c7_cc12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l208_c11_550e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l208_c7_cc12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l208_c11_550e_return_output;
     VAR_result_pc_uxn_opcodes_h_l200_c3_24ab := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l200_c15_afd6_return_output, 16);
     VAR_result_pc_MUX_uxn_opcodes_h_l189_c2_3317_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l196_l189_DUPLICATE_3024_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l196_c7_574d_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l196_l189_DUPLICATE_3024_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l196_c7_574d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l196_l202_l208_DUPLICATE_78d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l202_c7_7e58_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l196_l202_l208_DUPLICATE_78d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l208_c7_cc12_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l196_l202_l208_DUPLICATE_78d1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l189_c2_3317_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l202_l189_DUPLICATE_1a11_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l202_c7_7e58_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l202_l189_DUPLICATE_1a11_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l189_c2_3317_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l196_l189_l208_DUPLICATE_8374_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l196_c7_574d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l196_l189_l208_DUPLICATE_8374_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l208_c7_cc12_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l196_l189_l208_DUPLICATE_8374_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l189_c2_3317_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l196_l202_l189_DUPLICATE_fea4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l196_c7_574d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l196_l202_l189_DUPLICATE_fea4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l202_c7_7e58_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l196_l202_l189_DUPLICATE_fea4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l189_c2_3317_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l196_l202_l189_DUPLICATE_aa4c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l196_c7_574d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l196_l202_l189_DUPLICATE_aa4c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l202_c7_7e58_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l196_l202_l189_DUPLICATE_aa4c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l196_c7_574d_iffalse := VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l196_c7_574d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l196_c7_574d_iffalse := VAR_result_ram_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l196_c7_574d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l189_c2_3317_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l189_c2_3317_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l196_c7_574d_iftrue := VAR_result_pc_uxn_opcodes_h_l200_c3_24ab;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l208_c7_cc12] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l208_c7_cc12_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l208_c7_cc12_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l208_c7_cc12_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l208_c7_cc12_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l208_c7_cc12_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l208_c7_cc12_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l208_c7_cc12_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l208_c7_cc12_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l189_c2_3317] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l189_c2_3317_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l189_c2_3317_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l189_c2_3317_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l189_c2_3317_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l189_c2_3317_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l189_c2_3317_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l189_c2_3317_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l189_c2_3317_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l196_c7_574d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l196_c7_574d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l196_c7_574d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l196_c7_574d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l196_c7_574d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l196_c7_574d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l196_c7_574d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l196_c7_574d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l196_c7_574d_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l196_c7_574d] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l196_c7_574d_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l196_c7_574d_cond;
     result_pc_MUX_uxn_opcodes_h_l196_c7_574d_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l196_c7_574d_iftrue;
     result_pc_MUX_uxn_opcodes_h_l196_c7_574d_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l196_c7_574d_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l196_c7_574d_return_output := result_pc_MUX_uxn_opcodes_h_l196_c7_574d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l202_c7_7e58] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l202_c7_7e58_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l202_c7_7e58_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l202_c7_7e58_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l202_c7_7e58_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l202_c7_7e58_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l202_c7_7e58_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l202_c7_7e58_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l202_c7_7e58_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l196_c7_574d] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l196_c7_574d_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l196_c7_574d_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l196_c7_574d_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l196_c7_574d_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l196_c7_574d_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l196_c7_574d_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l196_c7_574d_return_output := result_ram_addr_MUX_uxn_opcodes_h_l196_c7_574d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l208_c7_cc12] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l208_c7_cc12_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l208_c7_cc12_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l208_c7_cc12_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l208_c7_cc12_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l208_c7_cc12_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l208_c7_cc12_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l208_c7_cc12_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l208_c7_cc12_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l202_c7_7e58] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l202_c7_7e58_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l202_c7_7e58_cond;
     result_stack_value_MUX_uxn_opcodes_h_l202_c7_7e58_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l202_c7_7e58_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l202_c7_7e58_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l202_c7_7e58_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l202_c7_7e58_return_output := result_stack_value_MUX_uxn_opcodes_h_l202_c7_7e58_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l189_c1_6556] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l189_c1_6556_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l189_c1_6556_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l189_c1_6556_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l189_c1_6556_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l189_c1_6556_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l189_c1_6556_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l189_c1_6556_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l189_c1_6556_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l202_c7_7e58] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l202_c7_7e58_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l202_c7_7e58_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l202_c7_7e58_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l202_c7_7e58_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l202_c7_7e58_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l202_c7_7e58_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l202_c7_7e58_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l202_c7_7e58_return_output;

     -- Submodule level 2
     VAR_printf_uxn_opcodes_h_l190_c3_8a40_uxn_opcodes_h_l190_c3_8a40_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l189_c1_6556_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l202_c7_7e58_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l208_c7_cc12_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l196_c7_574d_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l202_c7_7e58_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l189_c2_3317_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l196_c7_574d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l202_c7_7e58_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l208_c7_cc12_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l189_c2_3317_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l196_c7_574d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l189_c2_3317_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l196_c7_574d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l196_c7_574d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l202_c7_7e58_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l196_c7_574d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l202_c7_7e58_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l196_c7_574d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l196_c7_574d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l196_c7_574d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l196_c7_574d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l196_c7_574d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l196_c7_574d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l196_c7_574d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l196_c7_574d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l196_c7_574d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l196_c7_574d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l196_c7_574d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l196_c7_574d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l196_c7_574d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l196_c7_574d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l196_c7_574d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l196_c7_574d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l196_c7_574d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l196_c7_574d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l196_c7_574d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l196_c7_574d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l196_c7_574d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l196_c7_574d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l196_c7_574d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l196_c7_574d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l196_c7_574d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l196_c7_574d_return_output := result_stack_value_MUX_uxn_opcodes_h_l196_c7_574d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l202_c7_7e58] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l202_c7_7e58_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l202_c7_7e58_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l202_c7_7e58_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l202_c7_7e58_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l202_c7_7e58_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l202_c7_7e58_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l202_c7_7e58_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l202_c7_7e58_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l189_c2_3317] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l189_c2_3317_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l189_c2_3317_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l189_c2_3317_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l189_c2_3317_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l189_c2_3317_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l189_c2_3317_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l189_c2_3317_return_output := result_ram_addr_MUX_uxn_opcodes_h_l189_c2_3317_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l189_c2_3317] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l189_c2_3317_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l189_c2_3317_cond;
     result_pc_MUX_uxn_opcodes_h_l189_c2_3317_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l189_c2_3317_iftrue;
     result_pc_MUX_uxn_opcodes_h_l189_c2_3317_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l189_c2_3317_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l189_c2_3317_return_output := result_pc_MUX_uxn_opcodes_h_l189_c2_3317_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l189_c2_3317] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l189_c2_3317_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l189_c2_3317_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l189_c2_3317_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l189_c2_3317_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l189_c2_3317_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l189_c2_3317_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l189_c2_3317_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l189_c2_3317_return_output;

     -- printf_uxn_opcodes_h_l190_c3_8a40[uxn_opcodes_h_l190_c3_8a40] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l190_c3_8a40_uxn_opcodes_h_l190_c3_8a40_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l190_c3_8a40_uxn_opcodes_h_l190_c3_8a40_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_write_MUX[uxn_opcodes_h_l202_c7_7e58] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l202_c7_7e58_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l202_c7_7e58_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l202_c7_7e58_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l202_c7_7e58_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l202_c7_7e58_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l202_c7_7e58_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l202_c7_7e58_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l202_c7_7e58_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l196_c7_574d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l202_c7_7e58_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l189_c2_3317_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l196_c7_574d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l196_c7_574d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l202_c7_7e58_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l189_c2_3317_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l196_c7_574d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l189_c2_3317_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l196_c7_574d_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l189_c2_3317] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l189_c2_3317_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l189_c2_3317_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l189_c2_3317_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l189_c2_3317_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l189_c2_3317_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l189_c2_3317_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l189_c2_3317_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l189_c2_3317_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l196_c7_574d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l196_c7_574d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l196_c7_574d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l196_c7_574d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l196_c7_574d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l196_c7_574d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l196_c7_574d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l196_c7_574d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l196_c7_574d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l196_c7_574d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l196_c7_574d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l196_c7_574d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l196_c7_574d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l196_c7_574d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l196_c7_574d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l196_c7_574d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l196_c7_574d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l196_c7_574d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l189_c2_3317] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l189_c2_3317_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l189_c2_3317_cond;
     result_stack_value_MUX_uxn_opcodes_h_l189_c2_3317_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l189_c2_3317_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l189_c2_3317_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l189_c2_3317_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l189_c2_3317_return_output := result_stack_value_MUX_uxn_opcodes_h_l189_c2_3317_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l189_c2_3317] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l189_c2_3317_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l189_c2_3317_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l189_c2_3317_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l189_c2_3317_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l189_c2_3317_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l189_c2_3317_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l189_c2_3317_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l189_c2_3317_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l189_c2_3317_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l196_c7_574d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l189_c2_3317_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l196_c7_574d_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l189_c2_3317] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l189_c2_3317_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l189_c2_3317_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l189_c2_3317_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l189_c2_3317_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l189_c2_3317_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l189_c2_3317_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l189_c2_3317_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l189_c2_3317_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l189_c2_3317] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l189_c2_3317_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l189_c2_3317_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l189_c2_3317_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l189_c2_3317_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l189_c2_3317_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l189_c2_3317_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l189_c2_3317_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l189_c2_3317_return_output;

     -- Submodule level 5
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_ac32_uxn_opcodes_h_l213_l185_DUPLICATE_9278 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ac32_uxn_opcodes_h_l213_l185_DUPLICATE_9278_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_ac32(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l189_c2_3317_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l189_c2_3317_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l189_c2_3317_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l189_c2_3317_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l189_c2_3317_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l189_c2_3317_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l189_c2_3317_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l189_c2_3317_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l189_c2_3317_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ac32_uxn_opcodes_h_l213_l185_DUPLICATE_9278_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ac32_uxn_opcodes_h_l213_l185_DUPLICATE_9278_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
