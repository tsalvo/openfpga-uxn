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
-- Submodules: 69
entity sta2_0CLK_129a552b is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sta2_0CLK_129a552b;
architecture arch of sta2_0CLK_129a552b is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2297_c6_b76f]
signal BIN_OP_EQ_uxn_opcodes_h_l2297_c6_b76f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2297_c6_b76f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2297_c6_b76f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2297_c2_926d]
signal n16_MUX_uxn_opcodes_h_l2297_c2_926d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2297_c2_926d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2297_c2_926d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2297_c2_926d_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2297_c2_926d]
signal t16_MUX_uxn_opcodes_h_l2297_c2_926d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2297_c2_926d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2297_c2_926d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2297_c2_926d_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2297_c2_926d]
signal result_u16_value_MUX_uxn_opcodes_h_l2297_c2_926d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2297_c2_926d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2297_c2_926d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2297_c2_926d_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2297_c2_926d]
signal result_u8_value_MUX_uxn_opcodes_h_l2297_c2_926d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2297_c2_926d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2297_c2_926d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2297_c2_926d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2297_c2_926d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c2_926d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c2_926d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c2_926d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c2_926d_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2297_c2_926d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2297_c2_926d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2297_c2_926d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2297_c2_926d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2297_c2_926d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2297_c2_926d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c2_926d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c2_926d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c2_926d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c2_926d_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2297_c2_926d]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2297_c2_926d_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2297_c2_926d_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2297_c2_926d_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2297_c2_926d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2304_c11_629b]
signal BIN_OP_EQ_uxn_opcodes_h_l2304_c11_629b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2304_c11_629b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2304_c11_629b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2304_c7_bc46]
signal n16_MUX_uxn_opcodes_h_l2304_c7_bc46_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2304_c7_bc46_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2304_c7_bc46_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2304_c7_bc46_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2304_c7_bc46]
signal t16_MUX_uxn_opcodes_h_l2304_c7_bc46_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2304_c7_bc46_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2304_c7_bc46_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2304_c7_bc46_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2304_c7_bc46]
signal result_u16_value_MUX_uxn_opcodes_h_l2304_c7_bc46_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2304_c7_bc46_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2304_c7_bc46_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2304_c7_bc46_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2304_c7_bc46]
signal result_u8_value_MUX_uxn_opcodes_h_l2304_c7_bc46_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2304_c7_bc46_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2304_c7_bc46_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2304_c7_bc46_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2304_c7_bc46]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2304_c7_bc46_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2304_c7_bc46_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2304_c7_bc46_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2304_c7_bc46_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2304_c7_bc46]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2304_c7_bc46_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2304_c7_bc46_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2304_c7_bc46_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2304_c7_bc46_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2304_c7_bc46]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2304_c7_bc46_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2304_c7_bc46_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2304_c7_bc46_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2304_c7_bc46_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2304_c7_bc46]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2304_c7_bc46_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2304_c7_bc46_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2304_c7_bc46_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2304_c7_bc46_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2307_c11_05a5]
signal BIN_OP_EQ_uxn_opcodes_h_l2307_c11_05a5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2307_c11_05a5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2307_c11_05a5_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2307_c7_b62f]
signal n16_MUX_uxn_opcodes_h_l2307_c7_b62f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2307_c7_b62f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2307_c7_b62f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2307_c7_b62f_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2307_c7_b62f]
signal t16_MUX_uxn_opcodes_h_l2307_c7_b62f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2307_c7_b62f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2307_c7_b62f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2307_c7_b62f_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2307_c7_b62f]
signal result_u16_value_MUX_uxn_opcodes_h_l2307_c7_b62f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2307_c7_b62f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2307_c7_b62f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2307_c7_b62f_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2307_c7_b62f]
signal result_u8_value_MUX_uxn_opcodes_h_l2307_c7_b62f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2307_c7_b62f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2307_c7_b62f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2307_c7_b62f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2307_c7_b62f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2307_c7_b62f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2307_c7_b62f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2307_c7_b62f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2307_c7_b62f_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2307_c7_b62f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2307_c7_b62f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2307_c7_b62f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2307_c7_b62f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2307_c7_b62f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2307_c7_b62f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c7_b62f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c7_b62f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c7_b62f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c7_b62f_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2307_c7_b62f]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2307_c7_b62f_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2307_c7_b62f_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2307_c7_b62f_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2307_c7_b62f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2312_c11_0558]
signal BIN_OP_EQ_uxn_opcodes_h_l2312_c11_0558_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2312_c11_0558_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2312_c11_0558_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2312_c7_3ed1]
signal n16_MUX_uxn_opcodes_h_l2312_c7_3ed1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2312_c7_3ed1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2312_c7_3ed1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2312_c7_3ed1_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2312_c7_3ed1]
signal t16_MUX_uxn_opcodes_h_l2312_c7_3ed1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2312_c7_3ed1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2312_c7_3ed1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2312_c7_3ed1_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2312_c7_3ed1]
signal result_u16_value_MUX_uxn_opcodes_h_l2312_c7_3ed1_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2312_c7_3ed1_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2312_c7_3ed1_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2312_c7_3ed1_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2312_c7_3ed1]
signal result_u8_value_MUX_uxn_opcodes_h_l2312_c7_3ed1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2312_c7_3ed1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2312_c7_3ed1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2312_c7_3ed1_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2312_c7_3ed1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2312_c7_3ed1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2312_c7_3ed1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2312_c7_3ed1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2312_c7_3ed1_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2312_c7_3ed1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2312_c7_3ed1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2312_c7_3ed1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2312_c7_3ed1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2312_c7_3ed1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2312_c7_3ed1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2312_c7_3ed1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2312_c7_3ed1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2312_c7_3ed1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2312_c7_3ed1_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2312_c7_3ed1]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2312_c7_3ed1_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2312_c7_3ed1_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2312_c7_3ed1_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2312_c7_3ed1_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2313_c3_0f21]
signal BIN_OP_OR_uxn_opcodes_h_l2313_c3_0f21_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2313_c3_0f21_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2313_c3_0f21_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2316_c11_4e0b]
signal BIN_OP_EQ_uxn_opcodes_h_l2316_c11_4e0b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2316_c11_4e0b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2316_c11_4e0b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2316_c7_4055]
signal n16_MUX_uxn_opcodes_h_l2316_c7_4055_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2316_c7_4055_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2316_c7_4055_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2316_c7_4055_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2316_c7_4055]
signal result_u16_value_MUX_uxn_opcodes_h_l2316_c7_4055_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2316_c7_4055_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2316_c7_4055_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2316_c7_4055_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2316_c7_4055]
signal result_u8_value_MUX_uxn_opcodes_h_l2316_c7_4055_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2316_c7_4055_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2316_c7_4055_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2316_c7_4055_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2316_c7_4055]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_4055_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_4055_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_4055_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_4055_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2316_c7_4055]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_4055_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_4055_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_4055_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_4055_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2316_c7_4055]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2316_c7_4055_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2316_c7_4055_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2316_c7_4055_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2316_c7_4055_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2320_c11_5290]
signal BIN_OP_EQ_uxn_opcodes_h_l2320_c11_5290_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2320_c11_5290_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2320_c11_5290_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2320_c7_2b73]
signal n16_MUX_uxn_opcodes_h_l2320_c7_2b73_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2320_c7_2b73_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2320_c7_2b73_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2320_c7_2b73_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2320_c7_2b73]
signal result_u16_value_MUX_uxn_opcodes_h_l2320_c7_2b73_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2320_c7_2b73_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2320_c7_2b73_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2320_c7_2b73_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2320_c7_2b73]
signal result_u8_value_MUX_uxn_opcodes_h_l2320_c7_2b73_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2320_c7_2b73_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2320_c7_2b73_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2320_c7_2b73_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2320_c7_2b73]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_2b73_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_2b73_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_2b73_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_2b73_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2320_c7_2b73]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_2b73_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_2b73_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_2b73_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_2b73_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2320_c7_2b73]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2320_c7_2b73_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2320_c7_2b73_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2320_c7_2b73_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2320_c7_2b73_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2321_c3_1b35]
signal BIN_OP_OR_uxn_opcodes_h_l2321_c3_1b35_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2321_c3_1b35_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2321_c3_1b35_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2323_c30_f98c]
signal sp_relative_shift_uxn_opcodes_h_l2323_c30_f98c_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2323_c30_f98c_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2323_c30_f98c_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2323_c30_f98c_return_output : signed(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2326_c31_a661]
signal CONST_SR_8_uxn_opcodes_h_l2326_c31_a661_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2326_c31_a661_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2328_c11_e643]
signal BIN_OP_EQ_uxn_opcodes_h_l2328_c11_e643_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2328_c11_e643_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2328_c11_e643_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2328_c7_c815]
signal result_u16_value_MUX_uxn_opcodes_h_l2328_c7_c815_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2328_c7_c815_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2328_c7_c815_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2328_c7_c815_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2328_c7_c815]
signal result_u8_value_MUX_uxn_opcodes_h_l2328_c7_c815_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2328_c7_c815_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2328_c7_c815_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2328_c7_c815_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2328_c7_c815]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_c815_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_c815_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_c815_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_c815_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2328_c7_c815]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2328_c7_c815_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2328_c7_c815_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2328_c7_c815_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2328_c7_c815_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2328_c7_c815]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2328_c7_c815_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2328_c7_c815_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2328_c7_c815_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2328_c7_c815_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2330_c22_2d59]
signal BIN_OP_PLUS_uxn_opcodes_h_l2330_c22_2d59_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2330_c22_2d59_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2330_c22_2d59_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2333_c11_52ef]
signal BIN_OP_EQ_uxn_opcodes_h_l2333_c11_52ef_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2333_c11_52ef_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2333_c11_52ef_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2333_c7_54a6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2333_c7_54a6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2333_c7_54a6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2333_c7_54a6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2333_c7_54a6_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2333_c7_54a6]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2333_c7_54a6_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2333_c7_54a6_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2333_c7_54a6_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2333_c7_54a6_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2318_l2309_DUPLICATE_c0f2
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2318_l2309_DUPLICATE_c0f2_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2318_l2309_DUPLICATE_c0f2_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_7ccb( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u16_value := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_ram_write := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2297_c6_b76f
BIN_OP_EQ_uxn_opcodes_h_l2297_c6_b76f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2297_c6_b76f_left,
BIN_OP_EQ_uxn_opcodes_h_l2297_c6_b76f_right,
BIN_OP_EQ_uxn_opcodes_h_l2297_c6_b76f_return_output);

-- n16_MUX_uxn_opcodes_h_l2297_c2_926d
n16_MUX_uxn_opcodes_h_l2297_c2_926d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2297_c2_926d_cond,
n16_MUX_uxn_opcodes_h_l2297_c2_926d_iftrue,
n16_MUX_uxn_opcodes_h_l2297_c2_926d_iffalse,
n16_MUX_uxn_opcodes_h_l2297_c2_926d_return_output);

-- t16_MUX_uxn_opcodes_h_l2297_c2_926d
t16_MUX_uxn_opcodes_h_l2297_c2_926d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2297_c2_926d_cond,
t16_MUX_uxn_opcodes_h_l2297_c2_926d_iftrue,
t16_MUX_uxn_opcodes_h_l2297_c2_926d_iffalse,
t16_MUX_uxn_opcodes_h_l2297_c2_926d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2297_c2_926d
result_u16_value_MUX_uxn_opcodes_h_l2297_c2_926d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2297_c2_926d_cond,
result_u16_value_MUX_uxn_opcodes_h_l2297_c2_926d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2297_c2_926d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2297_c2_926d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2297_c2_926d
result_u8_value_MUX_uxn_opcodes_h_l2297_c2_926d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2297_c2_926d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2297_c2_926d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2297_c2_926d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2297_c2_926d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c2_926d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c2_926d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c2_926d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c2_926d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c2_926d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c2_926d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2297_c2_926d
result_is_opc_done_MUX_uxn_opcodes_h_l2297_c2_926d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2297_c2_926d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2297_c2_926d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2297_c2_926d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2297_c2_926d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c2_926d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c2_926d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c2_926d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c2_926d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c2_926d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c2_926d_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2297_c2_926d
result_is_ram_write_MUX_uxn_opcodes_h_l2297_c2_926d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2297_c2_926d_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2297_c2_926d_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2297_c2_926d_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2297_c2_926d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2304_c11_629b
BIN_OP_EQ_uxn_opcodes_h_l2304_c11_629b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2304_c11_629b_left,
BIN_OP_EQ_uxn_opcodes_h_l2304_c11_629b_right,
BIN_OP_EQ_uxn_opcodes_h_l2304_c11_629b_return_output);

-- n16_MUX_uxn_opcodes_h_l2304_c7_bc46
n16_MUX_uxn_opcodes_h_l2304_c7_bc46 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2304_c7_bc46_cond,
n16_MUX_uxn_opcodes_h_l2304_c7_bc46_iftrue,
n16_MUX_uxn_opcodes_h_l2304_c7_bc46_iffalse,
n16_MUX_uxn_opcodes_h_l2304_c7_bc46_return_output);

-- t16_MUX_uxn_opcodes_h_l2304_c7_bc46
t16_MUX_uxn_opcodes_h_l2304_c7_bc46 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2304_c7_bc46_cond,
t16_MUX_uxn_opcodes_h_l2304_c7_bc46_iftrue,
t16_MUX_uxn_opcodes_h_l2304_c7_bc46_iffalse,
t16_MUX_uxn_opcodes_h_l2304_c7_bc46_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2304_c7_bc46
result_u16_value_MUX_uxn_opcodes_h_l2304_c7_bc46 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2304_c7_bc46_cond,
result_u16_value_MUX_uxn_opcodes_h_l2304_c7_bc46_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2304_c7_bc46_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2304_c7_bc46_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2304_c7_bc46
result_u8_value_MUX_uxn_opcodes_h_l2304_c7_bc46 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2304_c7_bc46_cond,
result_u8_value_MUX_uxn_opcodes_h_l2304_c7_bc46_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2304_c7_bc46_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2304_c7_bc46_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2304_c7_bc46
result_sp_relative_shift_MUX_uxn_opcodes_h_l2304_c7_bc46 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2304_c7_bc46_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2304_c7_bc46_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2304_c7_bc46_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2304_c7_bc46_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2304_c7_bc46
result_is_opc_done_MUX_uxn_opcodes_h_l2304_c7_bc46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2304_c7_bc46_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2304_c7_bc46_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2304_c7_bc46_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2304_c7_bc46_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2304_c7_bc46
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2304_c7_bc46 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2304_c7_bc46_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2304_c7_bc46_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2304_c7_bc46_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2304_c7_bc46_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2304_c7_bc46
result_is_ram_write_MUX_uxn_opcodes_h_l2304_c7_bc46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2304_c7_bc46_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2304_c7_bc46_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2304_c7_bc46_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2304_c7_bc46_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2307_c11_05a5
BIN_OP_EQ_uxn_opcodes_h_l2307_c11_05a5 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2307_c11_05a5_left,
BIN_OP_EQ_uxn_opcodes_h_l2307_c11_05a5_right,
BIN_OP_EQ_uxn_opcodes_h_l2307_c11_05a5_return_output);

-- n16_MUX_uxn_opcodes_h_l2307_c7_b62f
n16_MUX_uxn_opcodes_h_l2307_c7_b62f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2307_c7_b62f_cond,
n16_MUX_uxn_opcodes_h_l2307_c7_b62f_iftrue,
n16_MUX_uxn_opcodes_h_l2307_c7_b62f_iffalse,
n16_MUX_uxn_opcodes_h_l2307_c7_b62f_return_output);

-- t16_MUX_uxn_opcodes_h_l2307_c7_b62f
t16_MUX_uxn_opcodes_h_l2307_c7_b62f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2307_c7_b62f_cond,
t16_MUX_uxn_opcodes_h_l2307_c7_b62f_iftrue,
t16_MUX_uxn_opcodes_h_l2307_c7_b62f_iffalse,
t16_MUX_uxn_opcodes_h_l2307_c7_b62f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2307_c7_b62f
result_u16_value_MUX_uxn_opcodes_h_l2307_c7_b62f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2307_c7_b62f_cond,
result_u16_value_MUX_uxn_opcodes_h_l2307_c7_b62f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2307_c7_b62f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2307_c7_b62f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2307_c7_b62f
result_u8_value_MUX_uxn_opcodes_h_l2307_c7_b62f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2307_c7_b62f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2307_c7_b62f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2307_c7_b62f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2307_c7_b62f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2307_c7_b62f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2307_c7_b62f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2307_c7_b62f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2307_c7_b62f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2307_c7_b62f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2307_c7_b62f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2307_c7_b62f
result_is_opc_done_MUX_uxn_opcodes_h_l2307_c7_b62f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2307_c7_b62f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2307_c7_b62f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2307_c7_b62f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2307_c7_b62f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c7_b62f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c7_b62f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c7_b62f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c7_b62f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c7_b62f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c7_b62f_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2307_c7_b62f
result_is_ram_write_MUX_uxn_opcodes_h_l2307_c7_b62f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2307_c7_b62f_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2307_c7_b62f_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2307_c7_b62f_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2307_c7_b62f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2312_c11_0558
BIN_OP_EQ_uxn_opcodes_h_l2312_c11_0558 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2312_c11_0558_left,
BIN_OP_EQ_uxn_opcodes_h_l2312_c11_0558_right,
BIN_OP_EQ_uxn_opcodes_h_l2312_c11_0558_return_output);

-- n16_MUX_uxn_opcodes_h_l2312_c7_3ed1
n16_MUX_uxn_opcodes_h_l2312_c7_3ed1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2312_c7_3ed1_cond,
n16_MUX_uxn_opcodes_h_l2312_c7_3ed1_iftrue,
n16_MUX_uxn_opcodes_h_l2312_c7_3ed1_iffalse,
n16_MUX_uxn_opcodes_h_l2312_c7_3ed1_return_output);

-- t16_MUX_uxn_opcodes_h_l2312_c7_3ed1
t16_MUX_uxn_opcodes_h_l2312_c7_3ed1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2312_c7_3ed1_cond,
t16_MUX_uxn_opcodes_h_l2312_c7_3ed1_iftrue,
t16_MUX_uxn_opcodes_h_l2312_c7_3ed1_iffalse,
t16_MUX_uxn_opcodes_h_l2312_c7_3ed1_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2312_c7_3ed1
result_u16_value_MUX_uxn_opcodes_h_l2312_c7_3ed1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2312_c7_3ed1_cond,
result_u16_value_MUX_uxn_opcodes_h_l2312_c7_3ed1_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2312_c7_3ed1_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2312_c7_3ed1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2312_c7_3ed1
result_u8_value_MUX_uxn_opcodes_h_l2312_c7_3ed1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2312_c7_3ed1_cond,
result_u8_value_MUX_uxn_opcodes_h_l2312_c7_3ed1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2312_c7_3ed1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2312_c7_3ed1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2312_c7_3ed1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2312_c7_3ed1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2312_c7_3ed1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2312_c7_3ed1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2312_c7_3ed1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2312_c7_3ed1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2312_c7_3ed1
result_is_opc_done_MUX_uxn_opcodes_h_l2312_c7_3ed1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2312_c7_3ed1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2312_c7_3ed1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2312_c7_3ed1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2312_c7_3ed1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2312_c7_3ed1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2312_c7_3ed1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2312_c7_3ed1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2312_c7_3ed1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2312_c7_3ed1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2312_c7_3ed1_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2312_c7_3ed1
result_is_ram_write_MUX_uxn_opcodes_h_l2312_c7_3ed1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2312_c7_3ed1_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2312_c7_3ed1_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2312_c7_3ed1_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2312_c7_3ed1_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2313_c3_0f21
BIN_OP_OR_uxn_opcodes_h_l2313_c3_0f21 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2313_c3_0f21_left,
BIN_OP_OR_uxn_opcodes_h_l2313_c3_0f21_right,
BIN_OP_OR_uxn_opcodes_h_l2313_c3_0f21_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2316_c11_4e0b
BIN_OP_EQ_uxn_opcodes_h_l2316_c11_4e0b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2316_c11_4e0b_left,
BIN_OP_EQ_uxn_opcodes_h_l2316_c11_4e0b_right,
BIN_OP_EQ_uxn_opcodes_h_l2316_c11_4e0b_return_output);

-- n16_MUX_uxn_opcodes_h_l2316_c7_4055
n16_MUX_uxn_opcodes_h_l2316_c7_4055 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2316_c7_4055_cond,
n16_MUX_uxn_opcodes_h_l2316_c7_4055_iftrue,
n16_MUX_uxn_opcodes_h_l2316_c7_4055_iffalse,
n16_MUX_uxn_opcodes_h_l2316_c7_4055_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2316_c7_4055
result_u16_value_MUX_uxn_opcodes_h_l2316_c7_4055 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2316_c7_4055_cond,
result_u16_value_MUX_uxn_opcodes_h_l2316_c7_4055_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2316_c7_4055_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2316_c7_4055_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2316_c7_4055
result_u8_value_MUX_uxn_opcodes_h_l2316_c7_4055 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2316_c7_4055_cond,
result_u8_value_MUX_uxn_opcodes_h_l2316_c7_4055_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2316_c7_4055_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2316_c7_4055_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_4055
result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_4055 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_4055_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_4055_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_4055_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_4055_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_4055
result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_4055 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_4055_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_4055_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_4055_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_4055_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2316_c7_4055
result_is_ram_write_MUX_uxn_opcodes_h_l2316_c7_4055 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2316_c7_4055_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2316_c7_4055_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2316_c7_4055_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2316_c7_4055_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2320_c11_5290
BIN_OP_EQ_uxn_opcodes_h_l2320_c11_5290 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2320_c11_5290_left,
BIN_OP_EQ_uxn_opcodes_h_l2320_c11_5290_right,
BIN_OP_EQ_uxn_opcodes_h_l2320_c11_5290_return_output);

-- n16_MUX_uxn_opcodes_h_l2320_c7_2b73
n16_MUX_uxn_opcodes_h_l2320_c7_2b73 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2320_c7_2b73_cond,
n16_MUX_uxn_opcodes_h_l2320_c7_2b73_iftrue,
n16_MUX_uxn_opcodes_h_l2320_c7_2b73_iffalse,
n16_MUX_uxn_opcodes_h_l2320_c7_2b73_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2320_c7_2b73
result_u16_value_MUX_uxn_opcodes_h_l2320_c7_2b73 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2320_c7_2b73_cond,
result_u16_value_MUX_uxn_opcodes_h_l2320_c7_2b73_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2320_c7_2b73_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2320_c7_2b73_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2320_c7_2b73
result_u8_value_MUX_uxn_opcodes_h_l2320_c7_2b73 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2320_c7_2b73_cond,
result_u8_value_MUX_uxn_opcodes_h_l2320_c7_2b73_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2320_c7_2b73_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2320_c7_2b73_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_2b73
result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_2b73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_2b73_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_2b73_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_2b73_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_2b73_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_2b73
result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_2b73 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_2b73_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_2b73_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_2b73_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_2b73_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2320_c7_2b73
result_is_ram_write_MUX_uxn_opcodes_h_l2320_c7_2b73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2320_c7_2b73_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2320_c7_2b73_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2320_c7_2b73_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2320_c7_2b73_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2321_c3_1b35
BIN_OP_OR_uxn_opcodes_h_l2321_c3_1b35 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2321_c3_1b35_left,
BIN_OP_OR_uxn_opcodes_h_l2321_c3_1b35_right,
BIN_OP_OR_uxn_opcodes_h_l2321_c3_1b35_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2323_c30_f98c
sp_relative_shift_uxn_opcodes_h_l2323_c30_f98c : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2323_c30_f98c_ins,
sp_relative_shift_uxn_opcodes_h_l2323_c30_f98c_x,
sp_relative_shift_uxn_opcodes_h_l2323_c30_f98c_y,
sp_relative_shift_uxn_opcodes_h_l2323_c30_f98c_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2326_c31_a661
CONST_SR_8_uxn_opcodes_h_l2326_c31_a661 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2326_c31_a661_x,
CONST_SR_8_uxn_opcodes_h_l2326_c31_a661_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2328_c11_e643
BIN_OP_EQ_uxn_opcodes_h_l2328_c11_e643 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2328_c11_e643_left,
BIN_OP_EQ_uxn_opcodes_h_l2328_c11_e643_right,
BIN_OP_EQ_uxn_opcodes_h_l2328_c11_e643_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2328_c7_c815
result_u16_value_MUX_uxn_opcodes_h_l2328_c7_c815 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2328_c7_c815_cond,
result_u16_value_MUX_uxn_opcodes_h_l2328_c7_c815_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2328_c7_c815_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2328_c7_c815_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2328_c7_c815
result_u8_value_MUX_uxn_opcodes_h_l2328_c7_c815 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2328_c7_c815_cond,
result_u8_value_MUX_uxn_opcodes_h_l2328_c7_c815_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2328_c7_c815_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2328_c7_c815_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_c815
result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_c815 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_c815_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_c815_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_c815_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_c815_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2328_c7_c815
result_sp_relative_shift_MUX_uxn_opcodes_h_l2328_c7_c815 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2328_c7_c815_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2328_c7_c815_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2328_c7_c815_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2328_c7_c815_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2328_c7_c815
result_is_ram_write_MUX_uxn_opcodes_h_l2328_c7_c815 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2328_c7_c815_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2328_c7_c815_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2328_c7_c815_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2328_c7_c815_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2330_c22_2d59
BIN_OP_PLUS_uxn_opcodes_h_l2330_c22_2d59 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2330_c22_2d59_left,
BIN_OP_PLUS_uxn_opcodes_h_l2330_c22_2d59_right,
BIN_OP_PLUS_uxn_opcodes_h_l2330_c22_2d59_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2333_c11_52ef
BIN_OP_EQ_uxn_opcodes_h_l2333_c11_52ef : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2333_c11_52ef_left,
BIN_OP_EQ_uxn_opcodes_h_l2333_c11_52ef_right,
BIN_OP_EQ_uxn_opcodes_h_l2333_c11_52ef_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2333_c7_54a6
result_is_opc_done_MUX_uxn_opcodes_h_l2333_c7_54a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2333_c7_54a6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2333_c7_54a6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2333_c7_54a6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2333_c7_54a6_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2333_c7_54a6
result_is_ram_write_MUX_uxn_opcodes_h_l2333_c7_54a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2333_c7_54a6_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2333_c7_54a6_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2333_c7_54a6_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2333_c7_54a6_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2318_l2309_DUPLICATE_c0f2
CONST_SL_8_uint16_t_uxn_opcodes_h_l2318_l2309_DUPLICATE_c0f2 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2318_l2309_DUPLICATE_c0f2_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2318_l2309_DUPLICATE_c0f2_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2297_c6_b76f_return_output,
 n16_MUX_uxn_opcodes_h_l2297_c2_926d_return_output,
 t16_MUX_uxn_opcodes_h_l2297_c2_926d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2297_c2_926d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2297_c2_926d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c2_926d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2297_c2_926d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c2_926d_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2297_c2_926d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2304_c11_629b_return_output,
 n16_MUX_uxn_opcodes_h_l2304_c7_bc46_return_output,
 t16_MUX_uxn_opcodes_h_l2304_c7_bc46_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2304_c7_bc46_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2304_c7_bc46_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2304_c7_bc46_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2304_c7_bc46_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2304_c7_bc46_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2304_c7_bc46_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2307_c11_05a5_return_output,
 n16_MUX_uxn_opcodes_h_l2307_c7_b62f_return_output,
 t16_MUX_uxn_opcodes_h_l2307_c7_b62f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2307_c7_b62f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2307_c7_b62f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2307_c7_b62f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2307_c7_b62f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c7_b62f_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2307_c7_b62f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2312_c11_0558_return_output,
 n16_MUX_uxn_opcodes_h_l2312_c7_3ed1_return_output,
 t16_MUX_uxn_opcodes_h_l2312_c7_3ed1_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2312_c7_3ed1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2312_c7_3ed1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2312_c7_3ed1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2312_c7_3ed1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2312_c7_3ed1_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2312_c7_3ed1_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2313_c3_0f21_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2316_c11_4e0b_return_output,
 n16_MUX_uxn_opcodes_h_l2316_c7_4055_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2316_c7_4055_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2316_c7_4055_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_4055_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_4055_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2316_c7_4055_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2320_c11_5290_return_output,
 n16_MUX_uxn_opcodes_h_l2320_c7_2b73_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2320_c7_2b73_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2320_c7_2b73_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_2b73_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_2b73_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2320_c7_2b73_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2321_c3_1b35_return_output,
 sp_relative_shift_uxn_opcodes_h_l2323_c30_f98c_return_output,
 CONST_SR_8_uxn_opcodes_h_l2326_c31_a661_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2328_c11_e643_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2328_c7_c815_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2328_c7_c815_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_c815_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2328_c7_c815_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2328_c7_c815_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2330_c22_2d59_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2333_c11_52ef_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2333_c7_54a6_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2333_c7_54a6_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2318_l2309_DUPLICATE_c0f2_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c6_b76f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c6_b76f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c6_b76f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2297_c2_926d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2297_c2_926d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2304_c7_bc46_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2297_c2_926d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2297_c2_926d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2297_c2_926d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2297_c2_926d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2304_c7_bc46_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2297_c2_926d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2297_c2_926d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2297_c2_926d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2297_c2_926d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2304_c7_bc46_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2297_c2_926d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2297_c2_926d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2297_c2_926d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2297_c2_926d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2304_c7_bc46_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2297_c2_926d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2297_c2_926d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c2_926d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c2_926d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2304_c7_bc46_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c2_926d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c2_926d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2297_c2_926d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2297_c2_926d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2304_c7_bc46_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2297_c2_926d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2297_c2_926d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c2_926d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2301_c3_d792 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c2_926d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2304_c7_bc46_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c2_926d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c2_926d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2297_c2_926d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2297_c2_926d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2304_c7_bc46_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2297_c2_926d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2297_c2_926d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2304_c11_629b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2304_c11_629b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2304_c11_629b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2304_c7_bc46_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2304_c7_bc46_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2307_c7_b62f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2304_c7_bc46_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2304_c7_bc46_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2304_c7_bc46_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2307_c7_b62f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2304_c7_bc46_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2304_c7_bc46_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2304_c7_bc46_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2307_c7_b62f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2304_c7_bc46_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2304_c7_bc46_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2304_c7_bc46_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2307_c7_b62f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2304_c7_bc46_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2304_c7_bc46_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2304_c7_bc46_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2307_c7_b62f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2304_c7_bc46_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2304_c7_bc46_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2304_c7_bc46_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2307_c7_b62f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2304_c7_bc46_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2304_c7_bc46_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2305_c3_5b0f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2304_c7_bc46_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c7_b62f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2304_c7_bc46_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2304_c7_bc46_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2304_c7_bc46_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2307_c7_b62f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2304_c7_bc46_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c11_05a5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c11_05a5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c11_05a5_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2307_c7_b62f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2307_c7_b62f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2312_c7_3ed1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2307_c7_b62f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2307_c7_b62f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2307_c7_b62f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2312_c7_3ed1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2307_c7_b62f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2307_c7_b62f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2307_c7_b62f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2312_c7_3ed1_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2307_c7_b62f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2307_c7_b62f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2307_c7_b62f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2312_c7_3ed1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2307_c7_b62f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2307_c7_b62f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2307_c7_b62f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2312_c7_3ed1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2307_c7_b62f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2307_c7_b62f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2307_c7_b62f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2312_c7_3ed1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2307_c7_b62f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c7_b62f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2310_c3_7ad2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c7_b62f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2312_c7_3ed1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c7_b62f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2307_c7_b62f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2307_c7_b62f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2312_c7_3ed1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2307_c7_b62f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2312_c11_0558_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2312_c11_0558_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2312_c11_0558_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2312_c7_3ed1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2312_c7_3ed1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2316_c7_4055_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2312_c7_3ed1_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2312_c7_3ed1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2312_c7_3ed1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2312_c7_3ed1_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2312_c7_3ed1_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2312_c7_3ed1_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2316_c7_4055_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2312_c7_3ed1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2312_c7_3ed1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2312_c7_3ed1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2316_c7_4055_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2312_c7_3ed1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2312_c7_3ed1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2312_c7_3ed1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_4055_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2312_c7_3ed1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2312_c7_3ed1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2312_c7_3ed1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_4055_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2312_c7_3ed1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2312_c7_3ed1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2314_c3_a1c8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2312_c7_3ed1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2312_c7_3ed1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2312_c7_3ed1_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2312_c7_3ed1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2312_c7_3ed1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2316_c7_4055_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2312_c7_3ed1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2313_c3_0f21_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2313_c3_0f21_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2313_c3_0f21_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_4e0b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_4e0b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_4e0b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2316_c7_4055_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2316_c7_4055_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2320_c7_2b73_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2316_c7_4055_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2316_c7_4055_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2316_c7_4055_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2320_c7_2b73_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2316_c7_4055_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2316_c7_4055_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2316_c7_4055_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2320_c7_2b73_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2316_c7_4055_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_4055_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_4055_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_2b73_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_4055_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_4055_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_4055_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_2b73_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_4055_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2316_c7_4055_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2316_c7_4055_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2320_c7_2b73_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2316_c7_4055_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_5290_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_5290_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_5290_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2320_c7_2b73_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2320_c7_2b73_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2320_c7_2b73_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2320_c7_2b73_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2320_c7_2b73_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2328_c7_c815_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2320_c7_2b73_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2320_c7_2b73_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2320_c7_2b73_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2328_c7_c815_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2320_c7_2b73_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_2b73_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_2b73_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_c815_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_2b73_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_2b73_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_2b73_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2328_c7_c815_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_2b73_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2320_c7_2b73_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2320_c7_2b73_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2328_c7_c815_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2320_c7_2b73_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2321_c3_1b35_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2321_c3_1b35_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2321_c3_1b35_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2323_c30_f98c_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2323_c30_f98c_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2323_c30_f98c_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2323_c30_f98c_return_output : signed(3 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2326_c31_a661_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2326_c31_a661_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2326_c21_090e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2328_c11_e643_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2328_c11_e643_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2328_c11_e643_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2328_c7_c815_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l2330_c3_66c5 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2328_c7_c815_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2328_c7_c815_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2328_c7_c815_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2328_c7_c815_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2328_c7_c815_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_c815_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_c815_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2333_c7_54a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_c815_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2328_c7_c815_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2329_c3_8d3f : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2328_c7_c815_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2328_c7_c815_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2328_c7_c815_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2328_c7_c815_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2333_c7_54a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2328_c7_c815_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2330_c22_2d59_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2330_c22_2d59_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2330_c22_2d59_return_output : unsigned(16 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2331_c21_06b8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2333_c11_52ef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2333_c11_52ef_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2333_c11_52ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2333_c7_54a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2333_c7_54a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2333_c7_54a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2333_c7_54a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2333_c7_54a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2333_c7_54a6_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2297_l2328_l2316_l2312_l2307_l2304_DUPLICATE_7f0a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2297_l2328_l2316_l2312_l2307_l2304_DUPLICATE_22d4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2297_l2328_l2316_l2312_l2307_l2304_DUPLICATE_d6d5_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2333_l2297_l2328_l2316_l2312_l2307_l2304_DUPLICATE_16e3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2333_l2328_l2320_l2316_l2312_l2307_l2304_DUPLICATE_5023_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2308_l2313_l2317_l2321_DUPLICATE_f39b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2318_l2309_DUPLICATE_c0f2_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2318_l2309_DUPLICATE_c0f2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7ccb_uxn_opcodes_h_l2338_l2293_DUPLICATE_e2e4_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2329_c3_8d3f := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2328_c7_c815_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2329_c3_8d3f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2312_c11_0558_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_5290_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2301_c3_d792 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c2_926d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2301_c3_d792;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2333_c7_54a6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c6_b76f_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2333_c7_54a6_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2310_c3_7ad2 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c7_b62f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2310_c3_7ad2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2304_c11_629b_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c11_05a5_right := to_unsigned(2, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2320_c7_2b73_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_4e0b_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2305_c3_5b0f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2304_c7_bc46_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2305_c3_5b0f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2333_c11_52ef_right := to_unsigned(7, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l2323_c30_f98c_y := to_signed(-4, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2314_c3_a1c8 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2312_c7_3ed1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2314_c3_a1c8;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2297_c2_926d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2328_c11_e643_right := to_unsigned(6, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l2323_c30_f98c_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2330_c22_2d59_right := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2323_c30_f98c_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2321_c3_1b35_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2297_c2_926d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2304_c7_bc46_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2307_c7_b62f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2312_c7_3ed1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2320_c7_2b73_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c6_b76f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2304_c11_629b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c11_05a5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2312_c11_0558_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_4e0b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_5290_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2328_c11_e643_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2333_c11_52ef_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2313_c3_0f21_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2330_c22_2d59_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2320_c7_2b73_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2297_c2_926d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2304_c7_bc46_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2312_c7_3ed1_iffalse := t16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2333_l2328_l2320_l2316_l2312_l2307_l2304_DUPLICATE_5023 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2333_l2328_l2320_l2316_l2312_l2307_l2304_DUPLICATE_5023_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2297_l2328_l2316_l2312_l2307_l2304_DUPLICATE_22d4 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2297_l2328_l2316_l2312_l2307_l2304_DUPLICATE_22d4_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2304_c11_629b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2304_c11_629b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2304_c11_629b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2304_c11_629b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2304_c11_629b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2304_c11_629b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2304_c11_629b_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2308_l2313_l2317_l2321_DUPLICATE_f39b LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2308_l2313_l2317_l2321_DUPLICATE_f39b_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2316_c11_4e0b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2316_c11_4e0b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_4e0b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2316_c11_4e0b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_4e0b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_4e0b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2316_c11_4e0b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2320_c11_5290] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2320_c11_5290_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_5290_left;
     BIN_OP_EQ_uxn_opcodes_h_l2320_c11_5290_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_5290_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_5290_return_output := BIN_OP_EQ_uxn_opcodes_h_l2320_c11_5290_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2312_c11_0558] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2312_c11_0558_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2312_c11_0558_left;
     BIN_OP_EQ_uxn_opcodes_h_l2312_c11_0558_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2312_c11_0558_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2312_c11_0558_return_output := BIN_OP_EQ_uxn_opcodes_h_l2312_c11_0558_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2330_c22_2d59] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2330_c22_2d59_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2330_c22_2d59_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2330_c22_2d59_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2330_c22_2d59_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2330_c22_2d59_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2330_c22_2d59_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2328_c11_e643] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2328_c11_e643_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2328_c11_e643_left;
     BIN_OP_EQ_uxn_opcodes_h_l2328_c11_e643_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2328_c11_e643_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2328_c11_e643_return_output := BIN_OP_EQ_uxn_opcodes_h_l2328_c11_e643_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2331_c21_06b8] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2331_c21_06b8_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2333_l2297_l2328_l2316_l2312_l2307_l2304_DUPLICATE_16e3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2333_l2297_l2328_l2316_l2312_l2307_l2304_DUPLICATE_16e3_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2297_c6_b76f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2297_c6_b76f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c6_b76f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2297_c6_b76f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c6_b76f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c6_b76f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2297_c6_b76f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2307_c11_05a5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2307_c11_05a5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c11_05a5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2307_c11_05a5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c11_05a5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c11_05a5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2307_c11_05a5_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2297_l2328_l2316_l2312_l2307_l2304_DUPLICATE_d6d5 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2297_l2328_l2316_l2312_l2307_l2304_DUPLICATE_d6d5_return_output := result.sp_relative_shift;

     -- sp_relative_shift[uxn_opcodes_h_l2323_c30_f98c] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2323_c30_f98c_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2323_c30_f98c_ins;
     sp_relative_shift_uxn_opcodes_h_l2323_c30_f98c_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2323_c30_f98c_x;
     sp_relative_shift_uxn_opcodes_h_l2323_c30_f98c_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2323_c30_f98c_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2323_c30_f98c_return_output := sp_relative_shift_uxn_opcodes_h_l2323_c30_f98c_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2297_l2328_l2316_l2312_l2307_l2304_DUPLICATE_7f0a LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2297_l2328_l2316_l2312_l2307_l2304_DUPLICATE_7f0a_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2333_c11_52ef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2333_c11_52ef_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2333_c11_52ef_left;
     BIN_OP_EQ_uxn_opcodes_h_l2333_c11_52ef_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2333_c11_52ef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2333_c11_52ef_return_output := BIN_OP_EQ_uxn_opcodes_h_l2333_c11_52ef_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2312_c7_3ed1] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2312_c7_3ed1_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l2297_c2_926d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c6_b76f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2297_c2_926d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c6_b76f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2297_c2_926d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c6_b76f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c2_926d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c6_b76f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c2_926d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c6_b76f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2297_c2_926d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c6_b76f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2297_c2_926d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c6_b76f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2297_c2_926d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c6_b76f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2304_c7_bc46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2304_c11_629b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2304_c7_bc46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2304_c11_629b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2304_c7_bc46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2304_c11_629b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2304_c7_bc46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2304_c11_629b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2304_c7_bc46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2304_c11_629b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2304_c7_bc46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2304_c11_629b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2304_c7_bc46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2304_c11_629b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2304_c7_bc46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2304_c11_629b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2307_c7_b62f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c11_05a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2307_c7_b62f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c11_05a5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2307_c7_b62f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c11_05a5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2307_c7_b62f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c11_05a5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c7_b62f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c11_05a5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2307_c7_b62f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c11_05a5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2307_c7_b62f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c11_05a5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2307_c7_b62f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2307_c11_05a5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2312_c7_3ed1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2312_c11_0558_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2312_c7_3ed1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2312_c11_0558_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2312_c7_3ed1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2312_c11_0558_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2312_c7_3ed1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2312_c11_0558_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2312_c7_3ed1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2312_c11_0558_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2312_c7_3ed1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2312_c11_0558_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2312_c7_3ed1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2312_c11_0558_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2312_c7_3ed1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2312_c11_0558_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2316_c7_4055_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_4e0b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_4055_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_4e0b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2316_c7_4055_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_4e0b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_4055_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_4e0b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2316_c7_4055_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_4e0b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2316_c7_4055_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2316_c11_4e0b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2320_c7_2b73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_5290_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_2b73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_5290_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2320_c7_2b73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_5290_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_2b73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_5290_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2320_c7_2b73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_5290_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2320_c7_2b73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_5290_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_c815_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2328_c11_e643_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2328_c7_c815_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2328_c11_e643_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2328_c7_c815_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2328_c11_e643_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2328_c7_c815_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2328_c11_e643_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2328_c7_c815_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2328_c11_e643_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2333_c7_54a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2333_c11_52ef_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2333_c7_54a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2333_c11_52ef_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l2330_c3_66c5 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2330_c22_2d59_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l2313_c3_0f21_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2308_l2313_l2317_l2321_DUPLICATE_f39b_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2321_c3_1b35_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2308_l2313_l2317_l2321_DUPLICATE_f39b_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2318_l2309_DUPLICATE_c0f2_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2308_l2313_l2317_l2321_DUPLICATE_f39b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2328_c7_c815_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2331_c21_06b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c2_926d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2297_l2328_l2316_l2312_l2307_l2304_DUPLICATE_d6d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2304_c7_bc46_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2297_l2328_l2316_l2312_l2307_l2304_DUPLICATE_d6d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2307_c7_b62f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2297_l2328_l2316_l2312_l2307_l2304_DUPLICATE_d6d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2312_c7_3ed1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2297_l2328_l2316_l2312_l2307_l2304_DUPLICATE_d6d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_4055_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2297_l2328_l2316_l2312_l2307_l2304_DUPLICATE_d6d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2328_c7_c815_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2297_l2328_l2316_l2312_l2307_l2304_DUPLICATE_d6d5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2297_c2_926d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2297_l2328_l2316_l2312_l2307_l2304_DUPLICATE_7f0a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2304_c7_bc46_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2297_l2328_l2316_l2312_l2307_l2304_DUPLICATE_7f0a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2307_c7_b62f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2297_l2328_l2316_l2312_l2307_l2304_DUPLICATE_7f0a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2312_c7_3ed1_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2297_l2328_l2316_l2312_l2307_l2304_DUPLICATE_7f0a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2316_c7_4055_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2297_l2328_l2316_l2312_l2307_l2304_DUPLICATE_7f0a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2328_c7_c815_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2297_l2328_l2316_l2312_l2307_l2304_DUPLICATE_7f0a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2304_c7_bc46_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2333_l2328_l2320_l2316_l2312_l2307_l2304_DUPLICATE_5023_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2307_c7_b62f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2333_l2328_l2320_l2316_l2312_l2307_l2304_DUPLICATE_5023_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2312_c7_3ed1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2333_l2328_l2320_l2316_l2312_l2307_l2304_DUPLICATE_5023_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_4055_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2333_l2328_l2320_l2316_l2312_l2307_l2304_DUPLICATE_5023_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_2b73_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2333_l2328_l2320_l2316_l2312_l2307_l2304_DUPLICATE_5023_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_c815_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2333_l2328_l2320_l2316_l2312_l2307_l2304_DUPLICATE_5023_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2333_c7_54a6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2333_l2328_l2320_l2316_l2312_l2307_l2304_DUPLICATE_5023_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2297_c2_926d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2333_l2297_l2328_l2316_l2312_l2307_l2304_DUPLICATE_16e3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2304_c7_bc46_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2333_l2297_l2328_l2316_l2312_l2307_l2304_DUPLICATE_16e3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2307_c7_b62f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2333_l2297_l2328_l2316_l2312_l2307_l2304_DUPLICATE_16e3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2312_c7_3ed1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2333_l2297_l2328_l2316_l2312_l2307_l2304_DUPLICATE_16e3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2316_c7_4055_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2333_l2297_l2328_l2316_l2312_l2307_l2304_DUPLICATE_16e3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2328_c7_c815_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2333_l2297_l2328_l2316_l2312_l2307_l2304_DUPLICATE_16e3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2333_c7_54a6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2333_l2297_l2328_l2316_l2312_l2307_l2304_DUPLICATE_16e3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2297_c2_926d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2297_l2328_l2316_l2312_l2307_l2304_DUPLICATE_22d4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2304_c7_bc46_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2297_l2328_l2316_l2312_l2307_l2304_DUPLICATE_22d4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2307_c7_b62f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2297_l2328_l2316_l2312_l2307_l2304_DUPLICATE_22d4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2312_c7_3ed1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2297_l2328_l2316_l2312_l2307_l2304_DUPLICATE_22d4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2316_c7_4055_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2297_l2328_l2316_l2312_l2307_l2304_DUPLICATE_22d4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2328_c7_c815_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2297_l2328_l2316_l2312_l2307_l2304_DUPLICATE_22d4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2312_c7_3ed1_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2312_c7_3ed1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_2b73_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2323_c30_f98c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2328_c7_c815_iftrue := VAR_result_u16_value_uxn_opcodes_h_l2330_c3_66c5;
     -- result_u16_value_MUX[uxn_opcodes_h_l2328_c7_c815] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2328_c7_c815_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2328_c7_c815_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2328_c7_c815_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2328_c7_c815_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2328_c7_c815_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2328_c7_c815_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2328_c7_c815_return_output := result_u16_value_MUX_uxn_opcodes_h_l2328_c7_c815_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2333_c7_54a6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2333_c7_54a6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2333_c7_54a6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2333_c7_54a6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2333_c7_54a6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2333_c7_54a6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2333_c7_54a6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2333_c7_54a6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2333_c7_54a6_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2318_l2309_DUPLICATE_c0f2 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2318_l2309_DUPLICATE_c0f2_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2318_l2309_DUPLICATE_c0f2_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2318_l2309_DUPLICATE_c0f2_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2318_l2309_DUPLICATE_c0f2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2312_c7_3ed1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2312_c7_3ed1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2312_c7_3ed1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2312_c7_3ed1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2312_c7_3ed1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2312_c7_3ed1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2312_c7_3ed1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2312_c7_3ed1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2312_c7_3ed1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2328_c7_c815] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2328_c7_c815_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2328_c7_c815_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2328_c7_c815_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2328_c7_c815_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2328_c7_c815_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2328_c7_c815_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2328_c7_c815_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2328_c7_c815_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2328_c7_c815] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2328_c7_c815_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2328_c7_c815_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2328_c7_c815_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2328_c7_c815_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2328_c7_c815_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2328_c7_c815_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2328_c7_c815_return_output := result_u8_value_MUX_uxn_opcodes_h_l2328_c7_c815_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2333_c7_54a6] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2333_c7_54a6_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2333_c7_54a6_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2333_c7_54a6_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2333_c7_54a6_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2333_c7_54a6_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2333_c7_54a6_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2333_c7_54a6_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2333_c7_54a6_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2313_c3_0f21] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2313_c3_0f21_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2313_c3_0f21_left;
     BIN_OP_OR_uxn_opcodes_h_l2313_c3_0f21_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2313_c3_0f21_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2313_c3_0f21_return_output := BIN_OP_OR_uxn_opcodes_h_l2313_c3_0f21_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2321_c3_1b35] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2321_c3_1b35_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2321_c3_1b35_left;
     BIN_OP_OR_uxn_opcodes_h_l2321_c3_1b35_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2321_c3_1b35_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2321_c3_1b35_return_output := BIN_OP_OR_uxn_opcodes_h_l2321_c3_1b35_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2312_c7_3ed1_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2313_c3_0f21_return_output;
     VAR_CONST_SR_8_uxn_opcodes_h_l2326_c31_a661_x := VAR_BIN_OP_OR_uxn_opcodes_h_l2321_c3_1b35_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2320_c7_2b73_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2321_c3_1b35_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2316_c7_4055_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2318_l2309_DUPLICATE_c0f2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2307_c7_b62f_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2318_l2309_DUPLICATE_c0f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_c815_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2333_c7_54a6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2328_c7_c815_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2333_c7_54a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_2b73_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2328_c7_c815_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c7_b62f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2312_c7_3ed1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2320_c7_2b73_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2328_c7_c815_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2320_c7_2b73_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2328_c7_c815_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2328_c7_c815] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_c815_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_c815_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_c815_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_c815_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_c815_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_c815_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_c815_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_c815_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2320_c7_2b73] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_2b73_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_2b73_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_2b73_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_2b73_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_2b73_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_2b73_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_2b73_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_2b73_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2320_c7_2b73] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2320_c7_2b73_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2320_c7_2b73_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2320_c7_2b73_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2320_c7_2b73_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2320_c7_2b73_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2320_c7_2b73_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2320_c7_2b73_return_output := result_u16_value_MUX_uxn_opcodes_h_l2320_c7_2b73_return_output;

     -- n16_MUX[uxn_opcodes_h_l2320_c7_2b73] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2320_c7_2b73_cond <= VAR_n16_MUX_uxn_opcodes_h_l2320_c7_2b73_cond;
     n16_MUX_uxn_opcodes_h_l2320_c7_2b73_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2320_c7_2b73_iftrue;
     n16_MUX_uxn_opcodes_h_l2320_c7_2b73_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2320_c7_2b73_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2320_c7_2b73_return_output := n16_MUX_uxn_opcodes_h_l2320_c7_2b73_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2328_c7_c815] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2328_c7_c815_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2328_c7_c815_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2328_c7_c815_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2328_c7_c815_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2328_c7_c815_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2328_c7_c815_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2328_c7_c815_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2328_c7_c815_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2307_c7_b62f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c7_b62f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c7_b62f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c7_b62f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c7_b62f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c7_b62f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c7_b62f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c7_b62f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c7_b62f_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2326_c31_a661] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2326_c31_a661_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2326_c31_a661_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2326_c31_a661_return_output := CONST_SR_8_uxn_opcodes_h_l2326_c31_a661_return_output;

     -- t16_MUX[uxn_opcodes_h_l2312_c7_3ed1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2312_c7_3ed1_cond <= VAR_t16_MUX_uxn_opcodes_h_l2312_c7_3ed1_cond;
     t16_MUX_uxn_opcodes_h_l2312_c7_3ed1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2312_c7_3ed1_iftrue;
     t16_MUX_uxn_opcodes_h_l2312_c7_3ed1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2312_c7_3ed1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2312_c7_3ed1_return_output := t16_MUX_uxn_opcodes_h_l2312_c7_3ed1_return_output;

     -- Submodule level 3
     VAR_n16_MUX_uxn_opcodes_h_l2316_c7_4055_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2320_c7_2b73_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_2b73_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2328_c7_c815_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2320_c7_2b73_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2328_c7_c815_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_4055_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2320_c7_2b73_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2304_c7_bc46_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2307_c7_b62f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2316_c7_4055_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2320_c7_2b73_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2307_c7_b62f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2312_c7_3ed1_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l2316_c7_4055] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2316_c7_4055_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2316_c7_4055_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2316_c7_4055_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2316_c7_4055_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2316_c7_4055_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2316_c7_4055_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2316_c7_4055_return_output := result_u16_value_MUX_uxn_opcodes_h_l2316_c7_4055_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2326_c21_090e] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2326_c21_090e_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2326_c31_a661_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2320_c7_2b73] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_2b73_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_2b73_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_2b73_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_2b73_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_2b73_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_2b73_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_2b73_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_2b73_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2320_c7_2b73] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2320_c7_2b73_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2320_c7_2b73_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2320_c7_2b73_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2320_c7_2b73_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2320_c7_2b73_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2320_c7_2b73_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2320_c7_2b73_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2320_c7_2b73_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2304_c7_bc46] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2304_c7_bc46_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2304_c7_bc46_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2304_c7_bc46_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2304_c7_bc46_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2304_c7_bc46_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2304_c7_bc46_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2304_c7_bc46_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2304_c7_bc46_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2316_c7_4055] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_4055_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_4055_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_4055_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_4055_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_4055_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_4055_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_4055_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_4055_return_output;

     -- n16_MUX[uxn_opcodes_h_l2316_c7_4055] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2316_c7_4055_cond <= VAR_n16_MUX_uxn_opcodes_h_l2316_c7_4055_cond;
     n16_MUX_uxn_opcodes_h_l2316_c7_4055_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2316_c7_4055_iftrue;
     n16_MUX_uxn_opcodes_h_l2316_c7_4055_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2316_c7_4055_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2316_c7_4055_return_output := n16_MUX_uxn_opcodes_h_l2316_c7_4055_return_output;

     -- t16_MUX[uxn_opcodes_h_l2307_c7_b62f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2307_c7_b62f_cond <= VAR_t16_MUX_uxn_opcodes_h_l2307_c7_b62f_cond;
     t16_MUX_uxn_opcodes_h_l2307_c7_b62f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2307_c7_b62f_iftrue;
     t16_MUX_uxn_opcodes_h_l2307_c7_b62f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2307_c7_b62f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2307_c7_b62f_return_output := t16_MUX_uxn_opcodes_h_l2307_c7_b62f_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2320_c7_2b73_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2326_c21_090e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2312_c7_3ed1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2316_c7_4055_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_4055_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_2b73_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2316_c7_4055_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2320_c7_2b73_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2312_c7_3ed1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2316_c7_4055_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c2_926d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2304_c7_bc46_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2312_c7_3ed1_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2316_c7_4055_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2304_c7_bc46_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2307_c7_b62f_return_output;
     -- n16_MUX[uxn_opcodes_h_l2312_c7_3ed1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2312_c7_3ed1_cond <= VAR_n16_MUX_uxn_opcodes_h_l2312_c7_3ed1_cond;
     n16_MUX_uxn_opcodes_h_l2312_c7_3ed1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2312_c7_3ed1_iftrue;
     n16_MUX_uxn_opcodes_h_l2312_c7_3ed1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2312_c7_3ed1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2312_c7_3ed1_return_output := n16_MUX_uxn_opcodes_h_l2312_c7_3ed1_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2316_c7_4055] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2316_c7_4055_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2316_c7_4055_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2316_c7_4055_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2316_c7_4055_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2316_c7_4055_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2316_c7_4055_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2316_c7_4055_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2316_c7_4055_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2312_c7_3ed1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2312_c7_3ed1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2312_c7_3ed1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2312_c7_3ed1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2312_c7_3ed1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2312_c7_3ed1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2312_c7_3ed1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2312_c7_3ed1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2312_c7_3ed1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2316_c7_4055] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_4055_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_4055_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_4055_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_4055_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_4055_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_4055_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_4055_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_4055_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2320_c7_2b73] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2320_c7_2b73_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2320_c7_2b73_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2320_c7_2b73_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2320_c7_2b73_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2320_c7_2b73_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2320_c7_2b73_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2320_c7_2b73_return_output := result_u8_value_MUX_uxn_opcodes_h_l2320_c7_2b73_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2312_c7_3ed1] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2312_c7_3ed1_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2312_c7_3ed1_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2312_c7_3ed1_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2312_c7_3ed1_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2312_c7_3ed1_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2312_c7_3ed1_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2312_c7_3ed1_return_output := result_u16_value_MUX_uxn_opcodes_h_l2312_c7_3ed1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2297_c2_926d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c2_926d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c2_926d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c2_926d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c2_926d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c2_926d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c2_926d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c2_926d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c2_926d_return_output;

     -- t16_MUX[uxn_opcodes_h_l2304_c7_bc46] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2304_c7_bc46_cond <= VAR_t16_MUX_uxn_opcodes_h_l2304_c7_bc46_cond;
     t16_MUX_uxn_opcodes_h_l2304_c7_bc46_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2304_c7_bc46_iftrue;
     t16_MUX_uxn_opcodes_h_l2304_c7_bc46_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2304_c7_bc46_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2304_c7_bc46_return_output := t16_MUX_uxn_opcodes_h_l2304_c7_bc46_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2307_c7_b62f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2312_c7_3ed1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2312_c7_3ed1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2316_c7_4055_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2312_c7_3ed1_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2316_c7_4055_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2307_c7_b62f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2312_c7_3ed1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2307_c7_b62f_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2312_c7_3ed1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2316_c7_4055_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2320_c7_2b73_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2297_c2_926d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2304_c7_bc46_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l2307_c7_b62f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2307_c7_b62f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2307_c7_b62f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2307_c7_b62f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2307_c7_b62f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2307_c7_b62f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2307_c7_b62f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2307_c7_b62f_return_output := result_u16_value_MUX_uxn_opcodes_h_l2307_c7_b62f_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2312_c7_3ed1] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2312_c7_3ed1_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2312_c7_3ed1_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2312_c7_3ed1_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2312_c7_3ed1_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2312_c7_3ed1_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2312_c7_3ed1_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2312_c7_3ed1_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2312_c7_3ed1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2312_c7_3ed1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2312_c7_3ed1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2312_c7_3ed1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2312_c7_3ed1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2312_c7_3ed1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2312_c7_3ed1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2312_c7_3ed1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2312_c7_3ed1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2312_c7_3ed1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2307_c7_b62f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2307_c7_b62f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2307_c7_b62f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2307_c7_b62f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2307_c7_b62f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2307_c7_b62f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2307_c7_b62f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2307_c7_b62f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2307_c7_b62f_return_output;

     -- t16_MUX[uxn_opcodes_h_l2297_c2_926d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2297_c2_926d_cond <= VAR_t16_MUX_uxn_opcodes_h_l2297_c2_926d_cond;
     t16_MUX_uxn_opcodes_h_l2297_c2_926d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2297_c2_926d_iftrue;
     t16_MUX_uxn_opcodes_h_l2297_c2_926d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2297_c2_926d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2297_c2_926d_return_output := t16_MUX_uxn_opcodes_h_l2297_c2_926d_return_output;

     -- n16_MUX[uxn_opcodes_h_l2307_c7_b62f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2307_c7_b62f_cond <= VAR_n16_MUX_uxn_opcodes_h_l2307_c7_b62f_cond;
     n16_MUX_uxn_opcodes_h_l2307_c7_b62f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2307_c7_b62f_iftrue;
     n16_MUX_uxn_opcodes_h_l2307_c7_b62f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2307_c7_b62f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2307_c7_b62f_return_output := n16_MUX_uxn_opcodes_h_l2307_c7_b62f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2316_c7_4055] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2316_c7_4055_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2316_c7_4055_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2316_c7_4055_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2316_c7_4055_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2316_c7_4055_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2316_c7_4055_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2316_c7_4055_return_output := result_u8_value_MUX_uxn_opcodes_h_l2316_c7_4055_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2304_c7_bc46_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2307_c7_b62f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2307_c7_b62f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2312_c7_3ed1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2307_c7_b62f_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2312_c7_3ed1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2304_c7_bc46_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2307_c7_b62f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2304_c7_bc46_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2307_c7_b62f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2312_c7_3ed1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2316_c7_4055_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2297_c2_926d_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2307_c7_b62f] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2307_c7_b62f_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2307_c7_b62f_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2307_c7_b62f_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2307_c7_b62f_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2307_c7_b62f_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2307_c7_b62f_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2307_c7_b62f_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2307_c7_b62f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2304_c7_bc46] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2304_c7_bc46_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2304_c7_bc46_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2304_c7_bc46_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2304_c7_bc46_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2304_c7_bc46_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2304_c7_bc46_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2304_c7_bc46_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2304_c7_bc46_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2312_c7_3ed1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2312_c7_3ed1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2312_c7_3ed1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2312_c7_3ed1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2312_c7_3ed1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2312_c7_3ed1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2312_c7_3ed1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2312_c7_3ed1_return_output := result_u8_value_MUX_uxn_opcodes_h_l2312_c7_3ed1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2307_c7_b62f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2307_c7_b62f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2307_c7_b62f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2307_c7_b62f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2307_c7_b62f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2307_c7_b62f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2307_c7_b62f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2307_c7_b62f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2307_c7_b62f_return_output;

     -- n16_MUX[uxn_opcodes_h_l2304_c7_bc46] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2304_c7_bc46_cond <= VAR_n16_MUX_uxn_opcodes_h_l2304_c7_bc46_cond;
     n16_MUX_uxn_opcodes_h_l2304_c7_bc46_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2304_c7_bc46_iftrue;
     n16_MUX_uxn_opcodes_h_l2304_c7_bc46_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2304_c7_bc46_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2304_c7_bc46_return_output := n16_MUX_uxn_opcodes_h_l2304_c7_bc46_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2304_c7_bc46] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2304_c7_bc46_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2304_c7_bc46_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2304_c7_bc46_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2304_c7_bc46_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2304_c7_bc46_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2304_c7_bc46_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2304_c7_bc46_return_output := result_u16_value_MUX_uxn_opcodes_h_l2304_c7_bc46_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2297_c2_926d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2304_c7_bc46_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2304_c7_bc46_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2307_c7_b62f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2304_c7_bc46_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2307_c7_b62f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c2_926d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2304_c7_bc46_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2297_c2_926d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2304_c7_bc46_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2307_c7_b62f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2312_c7_3ed1_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l2297_c2_926d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2297_c2_926d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2297_c2_926d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2297_c2_926d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2297_c2_926d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2297_c2_926d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2297_c2_926d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2297_c2_926d_return_output := result_u16_value_MUX_uxn_opcodes_h_l2297_c2_926d_return_output;

     -- n16_MUX[uxn_opcodes_h_l2297_c2_926d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2297_c2_926d_cond <= VAR_n16_MUX_uxn_opcodes_h_l2297_c2_926d_cond;
     n16_MUX_uxn_opcodes_h_l2297_c2_926d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2297_c2_926d_iftrue;
     n16_MUX_uxn_opcodes_h_l2297_c2_926d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2297_c2_926d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2297_c2_926d_return_output := n16_MUX_uxn_opcodes_h_l2297_c2_926d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2307_c7_b62f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2307_c7_b62f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2307_c7_b62f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2307_c7_b62f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2307_c7_b62f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2307_c7_b62f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2307_c7_b62f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2307_c7_b62f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2307_c7_b62f_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2304_c7_bc46] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2304_c7_bc46_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2304_c7_bc46_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2304_c7_bc46_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2304_c7_bc46_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2304_c7_bc46_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2304_c7_bc46_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2304_c7_bc46_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2304_c7_bc46_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2304_c7_bc46] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2304_c7_bc46_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2304_c7_bc46_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2304_c7_bc46_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2304_c7_bc46_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2304_c7_bc46_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2304_c7_bc46_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2304_c7_bc46_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2304_c7_bc46_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2297_c2_926d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c2_926d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c2_926d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c2_926d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c2_926d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c2_926d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c2_926d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c2_926d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c2_926d_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2297_c2_926d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2297_c2_926d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2304_c7_bc46_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2297_c2_926d_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2304_c7_bc46_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2304_c7_bc46_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2307_c7_b62f_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2297_c2_926d] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2297_c2_926d_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2297_c2_926d_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2297_c2_926d_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2297_c2_926d_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2297_c2_926d_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2297_c2_926d_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2297_c2_926d_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2297_c2_926d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2304_c7_bc46] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2304_c7_bc46_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2304_c7_bc46_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2304_c7_bc46_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2304_c7_bc46_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2304_c7_bc46_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2304_c7_bc46_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2304_c7_bc46_return_output := result_u8_value_MUX_uxn_opcodes_h_l2304_c7_bc46_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2297_c2_926d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2297_c2_926d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2297_c2_926d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2297_c2_926d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2297_c2_926d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2297_c2_926d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2297_c2_926d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2297_c2_926d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2297_c2_926d_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2297_c2_926d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2304_c7_bc46_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2297_c2_926d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2297_c2_926d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2297_c2_926d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2297_c2_926d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2297_c2_926d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2297_c2_926d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2297_c2_926d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2297_c2_926d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2297_c2_926d_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_7ccb_uxn_opcodes_h_l2338_l2293_DUPLICATE_e2e4 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7ccb_uxn_opcodes_h_l2338_l2293_DUPLICATE_e2e4_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_7ccb(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2297_c2_926d_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2297_c2_926d_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2297_c2_926d_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2297_c2_926d_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2297_c2_926d_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2297_c2_926d_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7ccb_uxn_opcodes_h_l2338_l2293_DUPLICATE_e2e4_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7ccb_uxn_opcodes_h_l2338_l2293_DUPLICATE_e2e4_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
