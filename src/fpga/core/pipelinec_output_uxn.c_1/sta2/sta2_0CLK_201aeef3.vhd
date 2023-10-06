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
-- Submodules: 122
entity sta2_0CLK_201aeef3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sta2_0CLK_201aeef3;
architecture arch of sta2_0CLK_201aeef3 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2717_c6_b9f6]
signal BIN_OP_EQ_uxn_opcodes_h_l2717_c6_b9f6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2717_c6_b9f6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2717_c6_b9f6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2717_c1_0b62]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_0b62_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_0b62_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_0b62_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_0b62_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2717_c2_8f8f]
signal n16_MUX_uxn_opcodes_h_l2717_c2_8f8f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2717_c2_8f8f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2717_c2_8f8f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2717_c2_8f8f]
signal t16_MUX_uxn_opcodes_h_l2717_c2_8f8f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2717_c2_8f8f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2717_c2_8f8f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2717_c2_8f8f]
signal result_ram_addr_MUX_uxn_opcodes_h_l2717_c2_8f8f_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2717_c2_8f8f_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2717_c2_8f8f_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2717_c2_8f8f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c2_8f8f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c2_8f8f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c2_8f8f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2717_c2_8f8f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c2_8f8f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c2_8f8f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c2_8f8f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2717_c2_8f8f]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2717_c2_8f8f_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2717_c2_8f8f_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2717_c2_8f8f_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2717_c2_8f8f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2717_c2_8f8f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2717_c2_8f8f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2717_c2_8f8f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2717_c2_8f8f]
signal result_ram_value_MUX_uxn_opcodes_h_l2717_c2_8f8f_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2717_c2_8f8f_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2717_c2_8f8f_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2717_c2_8f8f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2717_c2_8f8f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2717_c2_8f8f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2717_c2_8f8f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2717_c2_8f8f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2717_c2_8f8f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2717_c2_8f8f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2717_c2_8f8f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l2718_c3_2f5e[uxn_opcodes_h_l2718_c3_2f5e]
signal printf_uxn_opcodes_h_l2718_c3_2f5e_uxn_opcodes_h_l2718_c3_2f5e_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2723_c11_9b9e]
signal BIN_OP_EQ_uxn_opcodes_h_l2723_c11_9b9e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2723_c11_9b9e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2723_c11_9b9e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2723_c7_b403]
signal n16_MUX_uxn_opcodes_h_l2723_c7_b403_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2723_c7_b403_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2723_c7_b403_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2723_c7_b403_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2723_c7_b403]
signal t16_MUX_uxn_opcodes_h_l2723_c7_b403_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2723_c7_b403_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2723_c7_b403_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2723_c7_b403_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2723_c7_b403]
signal result_ram_addr_MUX_uxn_opcodes_h_l2723_c7_b403_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2723_c7_b403_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2723_c7_b403_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2723_c7_b403_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2723_c7_b403]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_b403_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_b403_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_b403_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_b403_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2723_c7_b403]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_b403_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_b403_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_b403_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_b403_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2723_c7_b403]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2723_c7_b403_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2723_c7_b403_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2723_c7_b403_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2723_c7_b403_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2723_c7_b403]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c7_b403_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c7_b403_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c7_b403_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c7_b403_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2723_c7_b403]
signal result_ram_value_MUX_uxn_opcodes_h_l2723_c7_b403_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2723_c7_b403_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2723_c7_b403_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2723_c7_b403_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2723_c7_b403]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_b403_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_b403_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_b403_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_b403_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2723_c7_b403]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2723_c7_b403_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2723_c7_b403_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2723_c7_b403_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2723_c7_b403_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2726_c11_d953]
signal BIN_OP_EQ_uxn_opcodes_h_l2726_c11_d953_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2726_c11_d953_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2726_c11_d953_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2726_c7_584d]
signal n16_MUX_uxn_opcodes_h_l2726_c7_584d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2726_c7_584d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2726_c7_584d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2726_c7_584d_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2726_c7_584d]
signal t16_MUX_uxn_opcodes_h_l2726_c7_584d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2726_c7_584d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2726_c7_584d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2726_c7_584d_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2726_c7_584d]
signal result_ram_addr_MUX_uxn_opcodes_h_l2726_c7_584d_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2726_c7_584d_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2726_c7_584d_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2726_c7_584d_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2726_c7_584d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_584d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_584d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_584d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_584d_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2726_c7_584d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_584d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_584d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_584d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_584d_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2726_c7_584d]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2726_c7_584d_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2726_c7_584d_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2726_c7_584d_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2726_c7_584d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2726_c7_584d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2726_c7_584d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2726_c7_584d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2726_c7_584d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2726_c7_584d_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2726_c7_584d]
signal result_ram_value_MUX_uxn_opcodes_h_l2726_c7_584d_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2726_c7_584d_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2726_c7_584d_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2726_c7_584d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2726_c7_584d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_584d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_584d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_584d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_584d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2726_c7_584d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2726_c7_584d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2726_c7_584d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2726_c7_584d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2726_c7_584d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2731_c11_ebaf]
signal BIN_OP_EQ_uxn_opcodes_h_l2731_c11_ebaf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2731_c11_ebaf_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2731_c11_ebaf_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2731_c7_5dc9]
signal n16_MUX_uxn_opcodes_h_l2731_c7_5dc9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2731_c7_5dc9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2731_c7_5dc9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2731_c7_5dc9]
signal t16_MUX_uxn_opcodes_h_l2731_c7_5dc9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2731_c7_5dc9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2731_c7_5dc9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2731_c7_5dc9]
signal result_ram_addr_MUX_uxn_opcodes_h_l2731_c7_5dc9_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2731_c7_5dc9_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2731_c7_5dc9_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2731_c7_5dc9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_5dc9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_5dc9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_5dc9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2731_c7_5dc9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_5dc9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_5dc9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_5dc9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2731_c7_5dc9]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2731_c7_5dc9_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2731_c7_5dc9_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2731_c7_5dc9_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2731_c7_5dc9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_5dc9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_5dc9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_5dc9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2731_c7_5dc9]
signal result_ram_value_MUX_uxn_opcodes_h_l2731_c7_5dc9_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2731_c7_5dc9_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2731_c7_5dc9_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2731_c7_5dc9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_5dc9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_5dc9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_5dc9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2731_c7_5dc9]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2731_c7_5dc9_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2731_c7_5dc9_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2731_c7_5dc9_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2734_c11_a448]
signal BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a448_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a448_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a448_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2734_c7_95fa]
signal n16_MUX_uxn_opcodes_h_l2734_c7_95fa_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2734_c7_95fa_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2734_c7_95fa_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2734_c7_95fa]
signal t16_MUX_uxn_opcodes_h_l2734_c7_95fa_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2734_c7_95fa_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2734_c7_95fa_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2734_c7_95fa]
signal result_ram_addr_MUX_uxn_opcodes_h_l2734_c7_95fa_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2734_c7_95fa_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2734_c7_95fa_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2734_c7_95fa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_95fa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_95fa_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_95fa_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2734_c7_95fa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_95fa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_95fa_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_95fa_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2734_c7_95fa]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2734_c7_95fa_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2734_c7_95fa_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2734_c7_95fa_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2734_c7_95fa]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2734_c7_95fa_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2734_c7_95fa_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2734_c7_95fa_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2734_c7_95fa]
signal result_ram_value_MUX_uxn_opcodes_h_l2734_c7_95fa_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2734_c7_95fa_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2734_c7_95fa_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2734_c7_95fa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_95fa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_95fa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_95fa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2734_c7_95fa]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2734_c7_95fa_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2734_c7_95fa_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2734_c7_95fa_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2735_c3_f825]
signal BIN_OP_OR_uxn_opcodes_h_l2735_c3_f825_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2735_c3_f825_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2735_c3_f825_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2738_c11_e56c]
signal BIN_OP_EQ_uxn_opcodes_h_l2738_c11_e56c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2738_c11_e56c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2738_c11_e56c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2738_c7_df52]
signal n16_MUX_uxn_opcodes_h_l2738_c7_df52_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2738_c7_df52_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2738_c7_df52_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2738_c7_df52_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2738_c7_df52]
signal result_ram_addr_MUX_uxn_opcodes_h_l2738_c7_df52_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2738_c7_df52_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2738_c7_df52_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2738_c7_df52_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2738_c7_df52]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2738_c7_df52_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2738_c7_df52_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2738_c7_df52_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2738_c7_df52_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2738_c7_df52]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_df52_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_df52_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_df52_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_df52_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2738_c7_df52]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2738_c7_df52_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2738_c7_df52_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2738_c7_df52_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2738_c7_df52_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2738_c7_df52]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2738_c7_df52_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2738_c7_df52_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2738_c7_df52_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2738_c7_df52_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2738_c7_df52]
signal result_ram_value_MUX_uxn_opcodes_h_l2738_c7_df52_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2738_c7_df52_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2738_c7_df52_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2738_c7_df52_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2738_c7_df52]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_df52_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_df52_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_df52_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_df52_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2738_c7_df52]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2738_c7_df52_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2738_c7_df52_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2738_c7_df52_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2738_c7_df52_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2741_c11_f284]
signal BIN_OP_EQ_uxn_opcodes_h_l2741_c11_f284_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2741_c11_f284_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2741_c11_f284_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2741_c7_1161]
signal n16_MUX_uxn_opcodes_h_l2741_c7_1161_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2741_c7_1161_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2741_c7_1161_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2741_c7_1161_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2741_c7_1161]
signal result_ram_addr_MUX_uxn_opcodes_h_l2741_c7_1161_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2741_c7_1161_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2741_c7_1161_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2741_c7_1161_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2741_c7_1161]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_1161_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_1161_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_1161_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_1161_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2741_c7_1161]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_1161_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_1161_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_1161_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_1161_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2741_c7_1161]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2741_c7_1161_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2741_c7_1161_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2741_c7_1161_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2741_c7_1161_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2741_c7_1161]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2741_c7_1161_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2741_c7_1161_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2741_c7_1161_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2741_c7_1161_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2741_c7_1161]
signal result_ram_value_MUX_uxn_opcodes_h_l2741_c7_1161_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2741_c7_1161_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2741_c7_1161_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2741_c7_1161_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2741_c7_1161]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_1161_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_1161_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_1161_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_1161_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2741_c7_1161]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2741_c7_1161_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2741_c7_1161_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2741_c7_1161_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2741_c7_1161_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2746_c11_5f6e]
signal BIN_OP_EQ_uxn_opcodes_h_l2746_c11_5f6e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2746_c11_5f6e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2746_c11_5f6e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2746_c7_5364]
signal n16_MUX_uxn_opcodes_h_l2746_c7_5364_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2746_c7_5364_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2746_c7_5364_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2746_c7_5364_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2746_c7_5364]
signal result_ram_addr_MUX_uxn_opcodes_h_l2746_c7_5364_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2746_c7_5364_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2746_c7_5364_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2746_c7_5364_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2746_c7_5364]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_5364_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_5364_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_5364_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_5364_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2746_c7_5364]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_5364_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_5364_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_5364_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_5364_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2746_c7_5364]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2746_c7_5364_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2746_c7_5364_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2746_c7_5364_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2746_c7_5364_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2746_c7_5364]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_5364_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_5364_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_5364_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_5364_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2746_c7_5364]
signal result_ram_value_MUX_uxn_opcodes_h_l2746_c7_5364_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2746_c7_5364_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2746_c7_5364_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2746_c7_5364_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2746_c7_5364]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_5364_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_5364_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_5364_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_5364_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2746_c7_5364]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2746_c7_5364_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2746_c7_5364_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2746_c7_5364_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2746_c7_5364_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2749_c11_c373]
signal BIN_OP_EQ_uxn_opcodes_h_l2749_c11_c373_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2749_c11_c373_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2749_c11_c373_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2749_c7_3685]
signal n16_MUX_uxn_opcodes_h_l2749_c7_3685_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2749_c7_3685_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2749_c7_3685_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2749_c7_3685_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2749_c7_3685]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2749_c7_3685_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2749_c7_3685_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2749_c7_3685_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2749_c7_3685_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2749_c7_3685]
signal result_ram_addr_MUX_uxn_opcodes_h_l2749_c7_3685_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2749_c7_3685_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2749_c7_3685_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2749_c7_3685_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2749_c7_3685]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_3685_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_3685_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_3685_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_3685_return_output : signed(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2749_c7_3685]
signal result_ram_value_MUX_uxn_opcodes_h_l2749_c7_3685_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2749_c7_3685_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2749_c7_3685_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2749_c7_3685_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2749_c7_3685]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_3685_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_3685_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_3685_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_3685_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2749_c7_3685]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2749_c7_3685_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2749_c7_3685_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2749_c7_3685_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2749_c7_3685_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2749_c7_3685]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2749_c7_3685_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2749_c7_3685_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2749_c7_3685_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2749_c7_3685_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2750_c3_b3be]
signal BIN_OP_OR_uxn_opcodes_h_l2750_c3_b3be_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2750_c3_b3be_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2750_c3_b3be_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2753_c32_ea0a]
signal BIN_OP_AND_uxn_opcodes_h_l2753_c32_ea0a_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2753_c32_ea0a_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2753_c32_ea0a_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2753_c32_0eea]
signal BIN_OP_GT_uxn_opcodes_h_l2753_c32_0eea_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2753_c32_0eea_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2753_c32_0eea_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2753_c32_1954]
signal MUX_uxn_opcodes_h_l2753_c32_1954_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2753_c32_1954_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2753_c32_1954_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2753_c32_1954_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2755_c11_aa68]
signal BIN_OP_EQ_uxn_opcodes_h_l2755_c11_aa68_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2755_c11_aa68_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2755_c11_aa68_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2755_c7_af18]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_af18_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_af18_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_af18_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_af18_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2755_c7_af18]
signal result_ram_addr_MUX_uxn_opcodes_h_l2755_c7_af18_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2755_c7_af18_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2755_c7_af18_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2755_c7_af18_return_output : unsigned(15 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2755_c7_af18]
signal result_ram_value_MUX_uxn_opcodes_h_l2755_c7_af18_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2755_c7_af18_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2755_c7_af18_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2755_c7_af18_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2755_c7_af18]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_af18_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_af18_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_af18_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_af18_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2755_c7_af18]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2755_c7_af18_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2755_c7_af18_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2755_c7_af18_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2755_c7_af18_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2759_c32_c2a8]
signal CONST_SR_8_uxn_opcodes_h_l2759_c32_c2a8_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2759_c32_c2a8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2761_c11_42b9]
signal BIN_OP_EQ_uxn_opcodes_h_l2761_c11_42b9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2761_c11_42b9_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2761_c11_42b9_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2761_c7_f5f7]
signal result_ram_addr_MUX_uxn_opcodes_h_l2761_c7_f5f7_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2761_c7_f5f7_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2761_c7_f5f7_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2761_c7_f5f7_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2761_c7_f5f7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_f5f7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_f5f7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_f5f7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_f5f7_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2761_c7_f5f7]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2761_c7_f5f7_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2761_c7_f5f7_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2761_c7_f5f7_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2761_c7_f5f7_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2761_c7_f5f7]
signal result_ram_value_MUX_uxn_opcodes_h_l2761_c7_f5f7_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2761_c7_f5f7_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2761_c7_f5f7_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2761_c7_f5f7_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2762_c21_1136]
signal BIN_OP_PLUS_uxn_opcodes_h_l2762_c21_1136_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2762_c21_1136_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2762_c21_1136_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2765_c11_b55d]
signal BIN_OP_EQ_uxn_opcodes_h_l2765_c11_b55d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2765_c11_b55d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2765_c11_b55d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2765_c7_8e47]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_8e47_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_8e47_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_8e47_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_8e47_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2765_c7_8e47]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2765_c7_8e47_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2765_c7_8e47_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2765_c7_8e47_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2765_c7_8e47_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2728_l2743_DUPLICATE_6daf
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2728_l2743_DUPLICATE_6daf_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2728_l2743_DUPLICATE_6daf_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_6c87( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.ram_addr := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_ram_write := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.ram_value := ref_toks_6;
      base.is_opc_done := ref_toks_7;
      base.is_stack_read := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2717_c6_b9f6
BIN_OP_EQ_uxn_opcodes_h_l2717_c6_b9f6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2717_c6_b9f6_left,
BIN_OP_EQ_uxn_opcodes_h_l2717_c6_b9f6_right,
BIN_OP_EQ_uxn_opcodes_h_l2717_c6_b9f6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_0b62
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_0b62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_0b62_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_0b62_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_0b62_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_0b62_return_output);

-- n16_MUX_uxn_opcodes_h_l2717_c2_8f8f
n16_MUX_uxn_opcodes_h_l2717_c2_8f8f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2717_c2_8f8f_cond,
n16_MUX_uxn_opcodes_h_l2717_c2_8f8f_iftrue,
n16_MUX_uxn_opcodes_h_l2717_c2_8f8f_iffalse,
n16_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output);

-- t16_MUX_uxn_opcodes_h_l2717_c2_8f8f
t16_MUX_uxn_opcodes_h_l2717_c2_8f8f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2717_c2_8f8f_cond,
t16_MUX_uxn_opcodes_h_l2717_c2_8f8f_iftrue,
t16_MUX_uxn_opcodes_h_l2717_c2_8f8f_iffalse,
t16_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2717_c2_8f8f
result_ram_addr_MUX_uxn_opcodes_h_l2717_c2_8f8f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2717_c2_8f8f_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2717_c2_8f8f_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2717_c2_8f8f_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c2_8f8f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c2_8f8f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c2_8f8f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c2_8f8f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c2_8f8f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c2_8f8f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c2_8f8f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c2_8f8f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c2_8f8f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c2_8f8f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2717_c2_8f8f
result_is_ram_write_MUX_uxn_opcodes_h_l2717_c2_8f8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2717_c2_8f8f_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2717_c2_8f8f_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2717_c2_8f8f_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2717_c2_8f8f
result_is_sp_shift_MUX_uxn_opcodes_h_l2717_c2_8f8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2717_c2_8f8f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2717_c2_8f8f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2717_c2_8f8f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2717_c2_8f8f
result_ram_value_MUX_uxn_opcodes_h_l2717_c2_8f8f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2717_c2_8f8f_cond,
result_ram_value_MUX_uxn_opcodes_h_l2717_c2_8f8f_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2717_c2_8f8f_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2717_c2_8f8f
result_is_opc_done_MUX_uxn_opcodes_h_l2717_c2_8f8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2717_c2_8f8f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2717_c2_8f8f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2717_c2_8f8f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2717_c2_8f8f
result_is_stack_read_MUX_uxn_opcodes_h_l2717_c2_8f8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2717_c2_8f8f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2717_c2_8f8f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2717_c2_8f8f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output);

-- printf_uxn_opcodes_h_l2718_c3_2f5e_uxn_opcodes_h_l2718_c3_2f5e
printf_uxn_opcodes_h_l2718_c3_2f5e_uxn_opcodes_h_l2718_c3_2f5e : entity work.printf_uxn_opcodes_h_l2718_c3_2f5e_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2718_c3_2f5e_uxn_opcodes_h_l2718_c3_2f5e_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2723_c11_9b9e
BIN_OP_EQ_uxn_opcodes_h_l2723_c11_9b9e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2723_c11_9b9e_left,
BIN_OP_EQ_uxn_opcodes_h_l2723_c11_9b9e_right,
BIN_OP_EQ_uxn_opcodes_h_l2723_c11_9b9e_return_output);

-- n16_MUX_uxn_opcodes_h_l2723_c7_b403
n16_MUX_uxn_opcodes_h_l2723_c7_b403 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2723_c7_b403_cond,
n16_MUX_uxn_opcodes_h_l2723_c7_b403_iftrue,
n16_MUX_uxn_opcodes_h_l2723_c7_b403_iffalse,
n16_MUX_uxn_opcodes_h_l2723_c7_b403_return_output);

-- t16_MUX_uxn_opcodes_h_l2723_c7_b403
t16_MUX_uxn_opcodes_h_l2723_c7_b403 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2723_c7_b403_cond,
t16_MUX_uxn_opcodes_h_l2723_c7_b403_iftrue,
t16_MUX_uxn_opcodes_h_l2723_c7_b403_iffalse,
t16_MUX_uxn_opcodes_h_l2723_c7_b403_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2723_c7_b403
result_ram_addr_MUX_uxn_opcodes_h_l2723_c7_b403 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2723_c7_b403_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2723_c7_b403_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2723_c7_b403_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2723_c7_b403_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_b403
result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_b403 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_b403_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_b403_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_b403_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_b403_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_b403
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_b403 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_b403_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_b403_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_b403_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_b403_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2723_c7_b403
result_is_ram_write_MUX_uxn_opcodes_h_l2723_c7_b403 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2723_c7_b403_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2723_c7_b403_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2723_c7_b403_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2723_c7_b403_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c7_b403
result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c7_b403 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c7_b403_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c7_b403_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c7_b403_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c7_b403_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2723_c7_b403
result_ram_value_MUX_uxn_opcodes_h_l2723_c7_b403 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2723_c7_b403_cond,
result_ram_value_MUX_uxn_opcodes_h_l2723_c7_b403_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2723_c7_b403_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2723_c7_b403_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_b403
result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_b403 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_b403_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_b403_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_b403_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_b403_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2723_c7_b403
result_is_stack_read_MUX_uxn_opcodes_h_l2723_c7_b403 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2723_c7_b403_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2723_c7_b403_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2723_c7_b403_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2723_c7_b403_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2726_c11_d953
BIN_OP_EQ_uxn_opcodes_h_l2726_c11_d953 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2726_c11_d953_left,
BIN_OP_EQ_uxn_opcodes_h_l2726_c11_d953_right,
BIN_OP_EQ_uxn_opcodes_h_l2726_c11_d953_return_output);

-- n16_MUX_uxn_opcodes_h_l2726_c7_584d
n16_MUX_uxn_opcodes_h_l2726_c7_584d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2726_c7_584d_cond,
n16_MUX_uxn_opcodes_h_l2726_c7_584d_iftrue,
n16_MUX_uxn_opcodes_h_l2726_c7_584d_iffalse,
n16_MUX_uxn_opcodes_h_l2726_c7_584d_return_output);

-- t16_MUX_uxn_opcodes_h_l2726_c7_584d
t16_MUX_uxn_opcodes_h_l2726_c7_584d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2726_c7_584d_cond,
t16_MUX_uxn_opcodes_h_l2726_c7_584d_iftrue,
t16_MUX_uxn_opcodes_h_l2726_c7_584d_iffalse,
t16_MUX_uxn_opcodes_h_l2726_c7_584d_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2726_c7_584d
result_ram_addr_MUX_uxn_opcodes_h_l2726_c7_584d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2726_c7_584d_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2726_c7_584d_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2726_c7_584d_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2726_c7_584d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_584d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_584d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_584d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_584d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_584d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_584d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_584d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_584d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_584d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_584d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_584d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_584d_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2726_c7_584d
result_is_ram_write_MUX_uxn_opcodes_h_l2726_c7_584d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2726_c7_584d_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2726_c7_584d_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2726_c7_584d_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2726_c7_584d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2726_c7_584d
result_is_sp_shift_MUX_uxn_opcodes_h_l2726_c7_584d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2726_c7_584d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2726_c7_584d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2726_c7_584d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2726_c7_584d_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2726_c7_584d
result_ram_value_MUX_uxn_opcodes_h_l2726_c7_584d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2726_c7_584d_cond,
result_ram_value_MUX_uxn_opcodes_h_l2726_c7_584d_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2726_c7_584d_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2726_c7_584d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_584d
result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_584d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_584d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_584d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_584d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_584d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2726_c7_584d
result_is_stack_read_MUX_uxn_opcodes_h_l2726_c7_584d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2726_c7_584d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2726_c7_584d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2726_c7_584d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2726_c7_584d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2731_c11_ebaf
BIN_OP_EQ_uxn_opcodes_h_l2731_c11_ebaf : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2731_c11_ebaf_left,
BIN_OP_EQ_uxn_opcodes_h_l2731_c11_ebaf_right,
BIN_OP_EQ_uxn_opcodes_h_l2731_c11_ebaf_return_output);

-- n16_MUX_uxn_opcodes_h_l2731_c7_5dc9
n16_MUX_uxn_opcodes_h_l2731_c7_5dc9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2731_c7_5dc9_cond,
n16_MUX_uxn_opcodes_h_l2731_c7_5dc9_iftrue,
n16_MUX_uxn_opcodes_h_l2731_c7_5dc9_iffalse,
n16_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output);

-- t16_MUX_uxn_opcodes_h_l2731_c7_5dc9
t16_MUX_uxn_opcodes_h_l2731_c7_5dc9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2731_c7_5dc9_cond,
t16_MUX_uxn_opcodes_h_l2731_c7_5dc9_iftrue,
t16_MUX_uxn_opcodes_h_l2731_c7_5dc9_iffalse,
t16_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2731_c7_5dc9
result_ram_addr_MUX_uxn_opcodes_h_l2731_c7_5dc9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2731_c7_5dc9_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2731_c7_5dc9_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2731_c7_5dc9_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_5dc9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_5dc9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_5dc9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_5dc9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_5dc9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_5dc9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_5dc9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_5dc9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_5dc9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_5dc9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2731_c7_5dc9
result_is_ram_write_MUX_uxn_opcodes_h_l2731_c7_5dc9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2731_c7_5dc9_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2731_c7_5dc9_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2731_c7_5dc9_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_5dc9
result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_5dc9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_5dc9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_5dc9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_5dc9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2731_c7_5dc9
result_ram_value_MUX_uxn_opcodes_h_l2731_c7_5dc9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2731_c7_5dc9_cond,
result_ram_value_MUX_uxn_opcodes_h_l2731_c7_5dc9_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2731_c7_5dc9_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_5dc9
result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_5dc9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_5dc9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_5dc9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_5dc9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2731_c7_5dc9
result_is_stack_read_MUX_uxn_opcodes_h_l2731_c7_5dc9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2731_c7_5dc9_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2731_c7_5dc9_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2731_c7_5dc9_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a448
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a448 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a448_left,
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a448_right,
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a448_return_output);

-- n16_MUX_uxn_opcodes_h_l2734_c7_95fa
n16_MUX_uxn_opcodes_h_l2734_c7_95fa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2734_c7_95fa_cond,
n16_MUX_uxn_opcodes_h_l2734_c7_95fa_iftrue,
n16_MUX_uxn_opcodes_h_l2734_c7_95fa_iffalse,
n16_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output);

-- t16_MUX_uxn_opcodes_h_l2734_c7_95fa
t16_MUX_uxn_opcodes_h_l2734_c7_95fa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2734_c7_95fa_cond,
t16_MUX_uxn_opcodes_h_l2734_c7_95fa_iftrue,
t16_MUX_uxn_opcodes_h_l2734_c7_95fa_iffalse,
t16_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2734_c7_95fa
result_ram_addr_MUX_uxn_opcodes_h_l2734_c7_95fa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2734_c7_95fa_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2734_c7_95fa_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2734_c7_95fa_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_95fa
result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_95fa : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_95fa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_95fa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_95fa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_95fa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_95fa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_95fa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_95fa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_95fa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2734_c7_95fa
result_is_ram_write_MUX_uxn_opcodes_h_l2734_c7_95fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2734_c7_95fa_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2734_c7_95fa_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2734_c7_95fa_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2734_c7_95fa
result_is_sp_shift_MUX_uxn_opcodes_h_l2734_c7_95fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2734_c7_95fa_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2734_c7_95fa_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2734_c7_95fa_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2734_c7_95fa
result_ram_value_MUX_uxn_opcodes_h_l2734_c7_95fa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2734_c7_95fa_cond,
result_ram_value_MUX_uxn_opcodes_h_l2734_c7_95fa_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2734_c7_95fa_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_95fa
result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_95fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_95fa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_95fa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_95fa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2734_c7_95fa
result_is_stack_read_MUX_uxn_opcodes_h_l2734_c7_95fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2734_c7_95fa_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2734_c7_95fa_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2734_c7_95fa_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2735_c3_f825
BIN_OP_OR_uxn_opcodes_h_l2735_c3_f825 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2735_c3_f825_left,
BIN_OP_OR_uxn_opcodes_h_l2735_c3_f825_right,
BIN_OP_OR_uxn_opcodes_h_l2735_c3_f825_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2738_c11_e56c
BIN_OP_EQ_uxn_opcodes_h_l2738_c11_e56c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2738_c11_e56c_left,
BIN_OP_EQ_uxn_opcodes_h_l2738_c11_e56c_right,
BIN_OP_EQ_uxn_opcodes_h_l2738_c11_e56c_return_output);

-- n16_MUX_uxn_opcodes_h_l2738_c7_df52
n16_MUX_uxn_opcodes_h_l2738_c7_df52 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2738_c7_df52_cond,
n16_MUX_uxn_opcodes_h_l2738_c7_df52_iftrue,
n16_MUX_uxn_opcodes_h_l2738_c7_df52_iffalse,
n16_MUX_uxn_opcodes_h_l2738_c7_df52_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2738_c7_df52
result_ram_addr_MUX_uxn_opcodes_h_l2738_c7_df52 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2738_c7_df52_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2738_c7_df52_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2738_c7_df52_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2738_c7_df52_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2738_c7_df52
result_sp_relative_shift_MUX_uxn_opcodes_h_l2738_c7_df52 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2738_c7_df52_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2738_c7_df52_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2738_c7_df52_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2738_c7_df52_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_df52
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_df52 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_df52_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_df52_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_df52_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_df52_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2738_c7_df52
result_is_ram_write_MUX_uxn_opcodes_h_l2738_c7_df52 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2738_c7_df52_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2738_c7_df52_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2738_c7_df52_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2738_c7_df52_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2738_c7_df52
result_is_sp_shift_MUX_uxn_opcodes_h_l2738_c7_df52 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2738_c7_df52_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2738_c7_df52_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2738_c7_df52_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2738_c7_df52_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2738_c7_df52
result_ram_value_MUX_uxn_opcodes_h_l2738_c7_df52 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2738_c7_df52_cond,
result_ram_value_MUX_uxn_opcodes_h_l2738_c7_df52_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2738_c7_df52_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2738_c7_df52_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_df52
result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_df52 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_df52_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_df52_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_df52_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_df52_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2738_c7_df52
result_is_stack_read_MUX_uxn_opcodes_h_l2738_c7_df52 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2738_c7_df52_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2738_c7_df52_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2738_c7_df52_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2738_c7_df52_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2741_c11_f284
BIN_OP_EQ_uxn_opcodes_h_l2741_c11_f284 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2741_c11_f284_left,
BIN_OP_EQ_uxn_opcodes_h_l2741_c11_f284_right,
BIN_OP_EQ_uxn_opcodes_h_l2741_c11_f284_return_output);

-- n16_MUX_uxn_opcodes_h_l2741_c7_1161
n16_MUX_uxn_opcodes_h_l2741_c7_1161 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2741_c7_1161_cond,
n16_MUX_uxn_opcodes_h_l2741_c7_1161_iftrue,
n16_MUX_uxn_opcodes_h_l2741_c7_1161_iffalse,
n16_MUX_uxn_opcodes_h_l2741_c7_1161_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2741_c7_1161
result_ram_addr_MUX_uxn_opcodes_h_l2741_c7_1161 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2741_c7_1161_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2741_c7_1161_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2741_c7_1161_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2741_c7_1161_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_1161
result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_1161 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_1161_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_1161_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_1161_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_1161_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_1161
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_1161 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_1161_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_1161_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_1161_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_1161_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2741_c7_1161
result_is_ram_write_MUX_uxn_opcodes_h_l2741_c7_1161 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2741_c7_1161_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2741_c7_1161_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2741_c7_1161_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2741_c7_1161_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2741_c7_1161
result_is_sp_shift_MUX_uxn_opcodes_h_l2741_c7_1161 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2741_c7_1161_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2741_c7_1161_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2741_c7_1161_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2741_c7_1161_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2741_c7_1161
result_ram_value_MUX_uxn_opcodes_h_l2741_c7_1161 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2741_c7_1161_cond,
result_ram_value_MUX_uxn_opcodes_h_l2741_c7_1161_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2741_c7_1161_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2741_c7_1161_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_1161
result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_1161 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_1161_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_1161_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_1161_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_1161_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2741_c7_1161
result_is_stack_read_MUX_uxn_opcodes_h_l2741_c7_1161 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2741_c7_1161_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2741_c7_1161_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2741_c7_1161_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2741_c7_1161_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2746_c11_5f6e
BIN_OP_EQ_uxn_opcodes_h_l2746_c11_5f6e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2746_c11_5f6e_left,
BIN_OP_EQ_uxn_opcodes_h_l2746_c11_5f6e_right,
BIN_OP_EQ_uxn_opcodes_h_l2746_c11_5f6e_return_output);

-- n16_MUX_uxn_opcodes_h_l2746_c7_5364
n16_MUX_uxn_opcodes_h_l2746_c7_5364 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2746_c7_5364_cond,
n16_MUX_uxn_opcodes_h_l2746_c7_5364_iftrue,
n16_MUX_uxn_opcodes_h_l2746_c7_5364_iffalse,
n16_MUX_uxn_opcodes_h_l2746_c7_5364_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2746_c7_5364
result_ram_addr_MUX_uxn_opcodes_h_l2746_c7_5364 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2746_c7_5364_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2746_c7_5364_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2746_c7_5364_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2746_c7_5364_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_5364
result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_5364 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_5364_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_5364_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_5364_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_5364_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_5364
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_5364 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_5364_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_5364_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_5364_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_5364_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2746_c7_5364
result_is_ram_write_MUX_uxn_opcodes_h_l2746_c7_5364 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2746_c7_5364_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2746_c7_5364_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2746_c7_5364_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2746_c7_5364_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_5364
result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_5364 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_5364_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_5364_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_5364_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_5364_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2746_c7_5364
result_ram_value_MUX_uxn_opcodes_h_l2746_c7_5364 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2746_c7_5364_cond,
result_ram_value_MUX_uxn_opcodes_h_l2746_c7_5364_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2746_c7_5364_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2746_c7_5364_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_5364
result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_5364 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_5364_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_5364_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_5364_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_5364_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2746_c7_5364
result_is_stack_read_MUX_uxn_opcodes_h_l2746_c7_5364 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2746_c7_5364_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2746_c7_5364_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2746_c7_5364_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2746_c7_5364_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2749_c11_c373
BIN_OP_EQ_uxn_opcodes_h_l2749_c11_c373 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2749_c11_c373_left,
BIN_OP_EQ_uxn_opcodes_h_l2749_c11_c373_right,
BIN_OP_EQ_uxn_opcodes_h_l2749_c11_c373_return_output);

-- n16_MUX_uxn_opcodes_h_l2749_c7_3685
n16_MUX_uxn_opcodes_h_l2749_c7_3685 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2749_c7_3685_cond,
n16_MUX_uxn_opcodes_h_l2749_c7_3685_iftrue,
n16_MUX_uxn_opcodes_h_l2749_c7_3685_iffalse,
n16_MUX_uxn_opcodes_h_l2749_c7_3685_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2749_c7_3685
result_is_sp_shift_MUX_uxn_opcodes_h_l2749_c7_3685 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2749_c7_3685_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2749_c7_3685_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2749_c7_3685_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2749_c7_3685_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2749_c7_3685
result_ram_addr_MUX_uxn_opcodes_h_l2749_c7_3685 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2749_c7_3685_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2749_c7_3685_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2749_c7_3685_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2749_c7_3685_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_3685
result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_3685 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_3685_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_3685_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_3685_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_3685_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2749_c7_3685
result_ram_value_MUX_uxn_opcodes_h_l2749_c7_3685 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2749_c7_3685_cond,
result_ram_value_MUX_uxn_opcodes_h_l2749_c7_3685_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2749_c7_3685_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2749_c7_3685_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_3685
result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_3685 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_3685_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_3685_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_3685_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_3685_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2749_c7_3685
result_is_ram_write_MUX_uxn_opcodes_h_l2749_c7_3685 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2749_c7_3685_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2749_c7_3685_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2749_c7_3685_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2749_c7_3685_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2749_c7_3685
result_is_stack_read_MUX_uxn_opcodes_h_l2749_c7_3685 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2749_c7_3685_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2749_c7_3685_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2749_c7_3685_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2749_c7_3685_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2750_c3_b3be
BIN_OP_OR_uxn_opcodes_h_l2750_c3_b3be : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2750_c3_b3be_left,
BIN_OP_OR_uxn_opcodes_h_l2750_c3_b3be_right,
BIN_OP_OR_uxn_opcodes_h_l2750_c3_b3be_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2753_c32_ea0a
BIN_OP_AND_uxn_opcodes_h_l2753_c32_ea0a : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2753_c32_ea0a_left,
BIN_OP_AND_uxn_opcodes_h_l2753_c32_ea0a_right,
BIN_OP_AND_uxn_opcodes_h_l2753_c32_ea0a_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2753_c32_0eea
BIN_OP_GT_uxn_opcodes_h_l2753_c32_0eea : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2753_c32_0eea_left,
BIN_OP_GT_uxn_opcodes_h_l2753_c32_0eea_right,
BIN_OP_GT_uxn_opcodes_h_l2753_c32_0eea_return_output);

-- MUX_uxn_opcodes_h_l2753_c32_1954
MUX_uxn_opcodes_h_l2753_c32_1954 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2753_c32_1954_cond,
MUX_uxn_opcodes_h_l2753_c32_1954_iftrue,
MUX_uxn_opcodes_h_l2753_c32_1954_iffalse,
MUX_uxn_opcodes_h_l2753_c32_1954_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2755_c11_aa68
BIN_OP_EQ_uxn_opcodes_h_l2755_c11_aa68 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2755_c11_aa68_left,
BIN_OP_EQ_uxn_opcodes_h_l2755_c11_aa68_right,
BIN_OP_EQ_uxn_opcodes_h_l2755_c11_aa68_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_af18
result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_af18 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_af18_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_af18_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_af18_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_af18_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2755_c7_af18
result_ram_addr_MUX_uxn_opcodes_h_l2755_c7_af18 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2755_c7_af18_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2755_c7_af18_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2755_c7_af18_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2755_c7_af18_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2755_c7_af18
result_ram_value_MUX_uxn_opcodes_h_l2755_c7_af18 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2755_c7_af18_cond,
result_ram_value_MUX_uxn_opcodes_h_l2755_c7_af18_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2755_c7_af18_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2755_c7_af18_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_af18
result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_af18 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_af18_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_af18_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_af18_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_af18_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2755_c7_af18
result_is_ram_write_MUX_uxn_opcodes_h_l2755_c7_af18 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2755_c7_af18_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2755_c7_af18_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2755_c7_af18_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2755_c7_af18_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2759_c32_c2a8
CONST_SR_8_uxn_opcodes_h_l2759_c32_c2a8 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2759_c32_c2a8_x,
CONST_SR_8_uxn_opcodes_h_l2759_c32_c2a8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2761_c11_42b9
BIN_OP_EQ_uxn_opcodes_h_l2761_c11_42b9 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2761_c11_42b9_left,
BIN_OP_EQ_uxn_opcodes_h_l2761_c11_42b9_right,
BIN_OP_EQ_uxn_opcodes_h_l2761_c11_42b9_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2761_c7_f5f7
result_ram_addr_MUX_uxn_opcodes_h_l2761_c7_f5f7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2761_c7_f5f7_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2761_c7_f5f7_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2761_c7_f5f7_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2761_c7_f5f7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_f5f7
result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_f5f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_f5f7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_f5f7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_f5f7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_f5f7_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2761_c7_f5f7
result_is_ram_write_MUX_uxn_opcodes_h_l2761_c7_f5f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2761_c7_f5f7_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2761_c7_f5f7_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2761_c7_f5f7_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2761_c7_f5f7_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2761_c7_f5f7
result_ram_value_MUX_uxn_opcodes_h_l2761_c7_f5f7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2761_c7_f5f7_cond,
result_ram_value_MUX_uxn_opcodes_h_l2761_c7_f5f7_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2761_c7_f5f7_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2761_c7_f5f7_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2762_c21_1136
BIN_OP_PLUS_uxn_opcodes_h_l2762_c21_1136 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2762_c21_1136_left,
BIN_OP_PLUS_uxn_opcodes_h_l2762_c21_1136_right,
BIN_OP_PLUS_uxn_opcodes_h_l2762_c21_1136_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2765_c11_b55d
BIN_OP_EQ_uxn_opcodes_h_l2765_c11_b55d : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2765_c11_b55d_left,
BIN_OP_EQ_uxn_opcodes_h_l2765_c11_b55d_right,
BIN_OP_EQ_uxn_opcodes_h_l2765_c11_b55d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_8e47
result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_8e47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_8e47_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_8e47_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_8e47_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_8e47_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2765_c7_8e47
result_is_ram_write_MUX_uxn_opcodes_h_l2765_c7_8e47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2765_c7_8e47_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2765_c7_8e47_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2765_c7_8e47_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2765_c7_8e47_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2728_l2743_DUPLICATE_6daf
CONST_SL_8_uint16_t_uxn_opcodes_h_l2728_l2743_DUPLICATE_6daf : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2728_l2743_DUPLICATE_6daf_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2728_l2743_DUPLICATE_6daf_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2717_c6_b9f6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_0b62_return_output,
 n16_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output,
 t16_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2723_c11_9b9e_return_output,
 n16_MUX_uxn_opcodes_h_l2723_c7_b403_return_output,
 t16_MUX_uxn_opcodes_h_l2723_c7_b403_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2723_c7_b403_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_b403_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_b403_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2723_c7_b403_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c7_b403_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2723_c7_b403_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_b403_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2723_c7_b403_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2726_c11_d953_return_output,
 n16_MUX_uxn_opcodes_h_l2726_c7_584d_return_output,
 t16_MUX_uxn_opcodes_h_l2726_c7_584d_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2726_c7_584d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_584d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_584d_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2726_c7_584d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2726_c7_584d_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2726_c7_584d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_584d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2726_c7_584d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2731_c11_ebaf_return_output,
 n16_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output,
 t16_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a448_return_output,
 n16_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output,
 t16_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2735_c3_f825_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2738_c11_e56c_return_output,
 n16_MUX_uxn_opcodes_h_l2738_c7_df52_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2738_c7_df52_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2738_c7_df52_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_df52_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2738_c7_df52_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2738_c7_df52_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2738_c7_df52_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_df52_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2738_c7_df52_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2741_c11_f284_return_output,
 n16_MUX_uxn_opcodes_h_l2741_c7_1161_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2741_c7_1161_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_1161_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_1161_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2741_c7_1161_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2741_c7_1161_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2741_c7_1161_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_1161_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2741_c7_1161_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2746_c11_5f6e_return_output,
 n16_MUX_uxn_opcodes_h_l2746_c7_5364_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2746_c7_5364_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_5364_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_5364_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2746_c7_5364_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_5364_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2746_c7_5364_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_5364_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2746_c7_5364_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2749_c11_c373_return_output,
 n16_MUX_uxn_opcodes_h_l2749_c7_3685_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2749_c7_3685_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2749_c7_3685_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_3685_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2749_c7_3685_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_3685_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2749_c7_3685_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2749_c7_3685_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2750_c3_b3be_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2753_c32_ea0a_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2753_c32_0eea_return_output,
 MUX_uxn_opcodes_h_l2753_c32_1954_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2755_c11_aa68_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_af18_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2755_c7_af18_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2755_c7_af18_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_af18_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2755_c7_af18_return_output,
 CONST_SR_8_uxn_opcodes_h_l2759_c32_c2a8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2761_c11_42b9_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2761_c7_f5f7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_f5f7_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2761_c7_f5f7_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2761_c7_f5f7_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2762_c21_1136_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2765_c11_b55d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_8e47_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2765_c7_8e47_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2728_l2743_DUPLICATE_6daf_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c6_b9f6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c6_b9f6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c6_b9f6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_0b62_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_0b62_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_0b62_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_0b62_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2717_c2_8f8f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2717_c2_8f8f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2723_c7_b403_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2717_c2_8f8f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2717_c2_8f8f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2717_c2_8f8f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2723_c7_b403_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2717_c2_8f8f_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2717_c2_8f8f_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2717_c2_8f8f_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2723_c7_b403_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2717_c2_8f8f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c2_8f8f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c2_8f8f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_b403_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c2_8f8f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c2_8f8f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2720_c3_85b3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c2_8f8f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_b403_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c2_8f8f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2717_c2_8f8f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2717_c2_8f8f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2723_c7_b403_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2717_c2_8f8f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2717_c2_8f8f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2717_c2_8f8f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c7_b403_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2717_c2_8f8f_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2717_c2_8f8f_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2717_c2_8f8f_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2723_c7_b403_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2717_c2_8f8f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c2_8f8f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c2_8f8f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_b403_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c2_8f8f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2717_c2_8f8f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2717_c2_8f8f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2723_c7_b403_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2717_c2_8f8f_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2718_c3_2f5e_uxn_opcodes_h_l2718_c3_2f5e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_9b9e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_9b9e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_9b9e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2723_c7_b403_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2723_c7_b403_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2726_c7_584d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2723_c7_b403_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2723_c7_b403_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2723_c7_b403_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2726_c7_584d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2723_c7_b403_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2723_c7_b403_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2723_c7_b403_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2726_c7_584d_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2723_c7_b403_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_b403_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_b403_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_584d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_b403_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_b403_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2724_c3_744d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_b403_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_584d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_b403_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2723_c7_b403_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2723_c7_b403_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2726_c7_584d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2723_c7_b403_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c7_b403_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c7_b403_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2726_c7_584d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c7_b403_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2723_c7_b403_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2723_c7_b403_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2726_c7_584d_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2723_c7_b403_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_b403_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_b403_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_584d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_b403_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2723_c7_b403_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2723_c7_b403_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2726_c7_584d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2723_c7_b403_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_d953_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_d953_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_d953_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2726_c7_584d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2726_c7_584d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2726_c7_584d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2726_c7_584d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2726_c7_584d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2726_c7_584d_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2726_c7_584d_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2726_c7_584d_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2726_c7_584d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_584d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_584d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_584d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_584d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2729_c3_3b89 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_584d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_584d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2726_c7_584d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2726_c7_584d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2726_c7_584d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2726_c7_584d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2726_c7_584d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2726_c7_584d_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2726_c7_584d_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2726_c7_584d_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2726_c7_584d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_584d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_584d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_584d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2726_c7_584d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2726_c7_584d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2726_c7_584d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_ebaf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_ebaf_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_ebaf_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2731_c7_5dc9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2731_c7_5dc9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2731_c7_5dc9_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2731_c7_5dc9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2731_c7_5dc9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2731_c7_5dc9_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2731_c7_5dc9_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2731_c7_5dc9_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2731_c7_5dc9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_5dc9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_5dc9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_5dc9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_5dc9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2732_c3_84f1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_5dc9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_5dc9_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2731_c7_5dc9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2731_c7_5dc9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2731_c7_5dc9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_5dc9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_5dc9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_5dc9_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2731_c7_5dc9_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2731_c7_5dc9_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2731_c7_5dc9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_5dc9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_5dc9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_5dc9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2731_c7_5dc9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2731_c7_5dc9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2731_c7_5dc9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a448_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a448_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a448_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2734_c7_95fa_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2734_c7_95fa_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2738_c7_df52_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2734_c7_95fa_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2734_c7_95fa_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2734_c7_95fa_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2734_c7_95fa_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2734_c7_95fa_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2734_c7_95fa_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2738_c7_df52_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2734_c7_95fa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_95fa_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_95fa_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2738_c7_df52_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_95fa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_95fa_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2736_c3_5003 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_95fa_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_df52_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_95fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2734_c7_95fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2734_c7_95fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2738_c7_df52_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2734_c7_95fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2734_c7_95fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2734_c7_95fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2738_c7_df52_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2734_c7_95fa_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2734_c7_95fa_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2734_c7_95fa_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2738_c7_df52_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2734_c7_95fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_95fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_95fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_df52_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_95fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2734_c7_95fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2734_c7_95fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2738_c7_df52_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2734_c7_95fa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2735_c3_f825_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2735_c3_f825_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2735_c3_f825_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_e56c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_e56c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_e56c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2738_c7_df52_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2738_c7_df52_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2741_c7_1161_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2738_c7_df52_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2738_c7_df52_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2738_c7_df52_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2741_c7_1161_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2738_c7_df52_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2738_c7_df52_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2738_c7_df52_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_1161_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2738_c7_df52_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_df52_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2739_c3_7e29 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_df52_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_1161_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_df52_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2738_c7_df52_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2738_c7_df52_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2741_c7_1161_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2738_c7_df52_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2738_c7_df52_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2738_c7_df52_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2741_c7_1161_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2738_c7_df52_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2738_c7_df52_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2738_c7_df52_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2741_c7_1161_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2738_c7_df52_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_df52_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_df52_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_1161_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_df52_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2738_c7_df52_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2738_c7_df52_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2741_c7_1161_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2738_c7_df52_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_f284_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_f284_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_f284_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2741_c7_1161_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2741_c7_1161_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2746_c7_5364_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2741_c7_1161_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2741_c7_1161_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2741_c7_1161_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2746_c7_5364_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2741_c7_1161_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_1161_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_1161_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_5364_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_1161_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_1161_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2744_c3_fc33 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_1161_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_5364_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_1161_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2741_c7_1161_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2741_c7_1161_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2746_c7_5364_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2741_c7_1161_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2741_c7_1161_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2741_c7_1161_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_5364_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2741_c7_1161_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2741_c7_1161_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2741_c7_1161_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2746_c7_5364_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2741_c7_1161_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_1161_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_1161_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_5364_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_1161_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2741_c7_1161_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2741_c7_1161_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2746_c7_5364_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2741_c7_1161_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_5f6e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_5f6e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_5f6e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2746_c7_5364_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2746_c7_5364_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2749_c7_3685_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2746_c7_5364_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2746_c7_5364_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2746_c7_5364_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2749_c7_3685_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2746_c7_5364_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_5364_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_5364_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_3685_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_5364_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_5364_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2747_c3_b78c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_5364_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2746_c7_5364_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_5364_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2746_c7_5364_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2746_c7_5364_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2749_c7_3685_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2746_c7_5364_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_5364_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_5364_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2749_c7_3685_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_5364_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2746_c7_5364_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2746_c7_5364_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2749_c7_3685_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2746_c7_5364_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_5364_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_5364_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_3685_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_5364_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2746_c7_5364_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2746_c7_5364_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2749_c7_3685_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2746_c7_5364_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_c373_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_c373_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_c373_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2749_c7_3685_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2749_c7_3685_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2749_c7_3685_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2749_c7_3685_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2749_c7_3685_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_af18_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2749_c7_3685_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2749_c7_3685_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2749_c7_3685_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2755_c7_af18_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2749_c7_3685_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_3685_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_3685_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_3685_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2749_c7_3685_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2749_c7_3685_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2755_c7_af18_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2749_c7_3685_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_3685_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_3685_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_af18_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_3685_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2749_c7_3685_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2749_c7_3685_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2755_c7_af18_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2749_c7_3685_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2749_c7_3685_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2749_c7_3685_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2749_c7_3685_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2750_c3_b3be_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2750_c3_b3be_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2750_c3_b3be_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2753_c32_1954_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2753_c32_1954_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2753_c32_1954_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2753_c32_ea0a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2753_c32_ea0a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2753_c32_ea0a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2753_c32_0eea_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2753_c32_0eea_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2753_c32_0eea_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2753_c32_1954_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_aa68_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_aa68_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_aa68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_af18_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_af18_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_af18_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2755_c7_af18_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2755_c7_af18_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2761_c7_f5f7_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2755_c7_af18_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2755_c7_af18_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2755_c7_af18_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2761_c7_f5f7_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2755_c7_af18_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_af18_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_af18_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_f5f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_af18_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2755_c7_af18_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2755_c7_af18_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2761_c7_f5f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2755_c7_af18_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2759_c32_c2a8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2759_c32_c2a8_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2759_c22_7dea_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_42b9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_42b9_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_42b9_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2761_c7_f5f7_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l2762_c3_5ab6 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2761_c7_f5f7_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2761_c7_f5f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_f5f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_f5f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_8e47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_f5f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2761_c7_f5f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2761_c7_f5f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2765_c7_8e47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2761_c7_f5f7_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2761_c7_f5f7_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2761_c7_f5f7_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2761_c7_f5f7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2762_c21_1136_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2762_c21_1136_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2762_c21_1136_return_output : unsigned(16 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2763_c22_1c3f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_b55d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_b55d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_b55d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_8e47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_8e47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_8e47_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2765_c7_8e47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2765_c7_8e47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2765_c7_8e47_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2741_l2738_l2734_l2761_l2731_l2726_l2749_l2723_l2746_l2717_DUPLICATE_4cc7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2741_l2738_l2734_l2731_l2726_l2749_l2723_l2746_l2717_DUPLICATE_d3e8_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2741_l2738_l2765_l2734_l2761_l2731_l2726_l2749_l2723_l2746_l2717_DUPLICATE_fec0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2741_l2738_l2734_l2731_l2755_l2726_l2723_l2746_l2717_DUPLICATE_f742_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2741_l2738_l2734_l2761_l2731_l2726_l2749_l2723_l2746_l2717_DUPLICATE_58db_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2741_l2738_l2765_l2734_l2761_l2731_l2755_l2726_l2749_l2723_l2746_DUPLICATE_f528_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2741_l2738_l2734_l2731_l2726_l2749_l2723_l2746_DUPLICATE_9256_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2727_l2742_l2735_l2750_DUPLICATE_a986_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2728_l2743_DUPLICATE_6daf_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2728_l2743_DUPLICATE_6daf_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6c87_uxn_opcodes_h_l2713_l2770_DUPLICATE_855f_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_5f6e_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_ebaf_right := to_unsigned(3, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_0b62_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2753_c32_1954_iffalse := resize(to_signed(-4, 4), 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c2_8f8f_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_8e47_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2720_c3_85b3 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c2_8f8f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2720_c3_85b3;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2724_c3_744d := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_b403_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2724_c3_744d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_b55d_right := to_unsigned(11, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_af18_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c6_b9f6_right := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2753_c32_0eea_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2749_c7_3685_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2762_c21_1136_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2729_c3_3b89 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_584d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2729_c3_3b89;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2747_c3_b78c := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_5364_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2747_c3_b78c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_f284_right := to_unsigned(6, 3);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2753_c32_ea0a_right := to_unsigned(128, 8);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2755_c7_af18_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2765_c7_8e47_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_d953_right := to_unsigned(2, 2);
     VAR_MUX_uxn_opcodes_h_l2753_c32_1954_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2736_c3_5003 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_95fa_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2736_c3_5003;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_c373_right := to_unsigned(8, 4);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2749_c7_3685_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2739_c3_7e29 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_df52_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2739_c3_7e29;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_9b9e_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_42b9_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2732_c3_84f1 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_5dc9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2732_c3_84f1;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2744_c3_fc33 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_1161_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2744_c3_fc33;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a448_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_aa68_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_e56c_right := to_unsigned(5, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2717_c2_8f8f_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_0b62_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2753_c32_ea0a_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2750_c3_b3be_left := n16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2759_c32_c2a8_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2717_c2_8f8f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2723_c7_b403_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2726_c7_584d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2731_c7_5dc9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2734_c7_95fa_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2738_c7_df52_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2746_c7_5364_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2749_c7_3685_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c6_b9f6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_9b9e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_d953_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_ebaf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a448_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_e56c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_f284_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_5f6e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_c373_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_aa68_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_42b9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_b55d_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2735_c3_f825_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2762_c21_1136_left := t16;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2755_c7_af18_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2717_c2_8f8f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2723_c7_b403_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2731_c7_5dc9_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2734_c7_95fa_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2734_c11_a448] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a448_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a448_left;
     BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a448_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a448_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a448_return_output := BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a448_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2741_l2738_l2765_l2734_l2761_l2731_l2726_l2749_l2723_l2746_l2717_DUPLICATE_fec0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2741_l2738_l2765_l2734_l2761_l2731_l2726_l2749_l2723_l2746_l2717_DUPLICATE_fec0_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2741_l2738_l2734_l2731_l2755_l2726_l2723_l2746_l2717_DUPLICATE_f742 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2741_l2738_l2734_l2731_l2755_l2726_l2723_l2746_l2717_DUPLICATE_f742_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2738_c11_e56c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2738_c11_e56c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_e56c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2738_c11_e56c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_e56c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_e56c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2738_c11_e56c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2746_c11_5f6e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2746_c11_5f6e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_5f6e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2746_c11_5f6e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_5f6e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_5f6e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2746_c11_5f6e_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2741_l2738_l2734_l2761_l2731_l2726_l2749_l2723_l2746_l2717_DUPLICATE_4cc7 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2741_l2738_l2734_l2761_l2731_l2726_l2749_l2723_l2746_l2717_DUPLICATE_4cc7_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l2765_c11_b55d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2765_c11_b55d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_b55d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2765_c11_b55d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_b55d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_b55d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2765_c11_b55d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2723_c11_9b9e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2723_c11_9b9e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_9b9e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2723_c11_9b9e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_9b9e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_9b9e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2723_c11_9b9e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2726_c11_d953] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2726_c11_d953_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_d953_left;
     BIN_OP_EQ_uxn_opcodes_h_l2726_c11_d953_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_d953_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_d953_return_output := BIN_OP_EQ_uxn_opcodes_h_l2726_c11_d953_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2731_c11_ebaf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2731_c11_ebaf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_ebaf_left;
     BIN_OP_EQ_uxn_opcodes_h_l2731_c11_ebaf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_ebaf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_ebaf_return_output := BIN_OP_EQ_uxn_opcodes_h_l2731_c11_ebaf_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2759_c32_c2a8] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2759_c32_c2a8_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2759_c32_c2a8_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2759_c32_c2a8_return_output := CONST_SR_8_uxn_opcodes_h_l2759_c32_c2a8_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2741_l2738_l2734_l2761_l2731_l2726_l2749_l2723_l2746_l2717_DUPLICATE_58db LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2741_l2738_l2734_l2761_l2731_l2726_l2749_l2723_l2746_l2717_DUPLICATE_58db_return_output := result.ram_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2717_c6_b9f6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2717_c6_b9f6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c6_b9f6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2717_c6_b9f6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c6_b9f6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c6_b9f6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2717_c6_b9f6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2755_c11_aa68] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2755_c11_aa68_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_aa68_left;
     BIN_OP_EQ_uxn_opcodes_h_l2755_c11_aa68_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_aa68_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_aa68_return_output := BIN_OP_EQ_uxn_opcodes_h_l2755_c11_aa68_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2749_c11_c373] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2749_c11_c373_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_c373_left;
     BIN_OP_EQ_uxn_opcodes_h_l2749_c11_c373_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_c373_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_c373_return_output := BIN_OP_EQ_uxn_opcodes_h_l2749_c11_c373_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2741_c11_f284] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2741_c11_f284_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_f284_left;
     BIN_OP_EQ_uxn_opcodes_h_l2741_c11_f284_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_f284_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_f284_return_output := BIN_OP_EQ_uxn_opcodes_h_l2741_c11_f284_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2741_l2738_l2734_l2731_l2726_l2749_l2723_l2746_l2717_DUPLICATE_d3e8 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2741_l2738_l2734_l2731_l2726_l2749_l2723_l2746_l2717_DUPLICATE_d3e8_return_output := result.sp_relative_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2727_l2742_l2735_l2750_DUPLICATE_a986 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2727_l2742_l2735_l2750_DUPLICATE_a986_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2746_c7_5364] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2746_c7_5364_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2761_c11_42b9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2761_c11_42b9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_42b9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2761_c11_42b9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_42b9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_42b9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2761_c11_42b9_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2753_c32_ea0a] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2753_c32_ea0a_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2753_c32_ea0a_left;
     BIN_OP_AND_uxn_opcodes_h_l2753_c32_ea0a_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2753_c32_ea0a_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2753_c32_ea0a_return_output := BIN_OP_AND_uxn_opcodes_h_l2753_c32_ea0a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2741_l2738_l2765_l2734_l2761_l2731_l2755_l2726_l2749_l2723_l2746_DUPLICATE_f528 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2741_l2738_l2765_l2734_l2761_l2731_l2755_l2726_l2749_l2723_l2746_DUPLICATE_f528_return_output := result.is_opc_done;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2762_c21_1136] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2762_c21_1136_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2762_c21_1136_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2762_c21_1136_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2762_c21_1136_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2762_c21_1136_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2762_c21_1136_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2741_l2738_l2734_l2731_l2726_l2749_l2723_l2746_DUPLICATE_9256 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2741_l2738_l2734_l2731_l2726_l2749_l2723_l2746_DUPLICATE_9256_return_output := result.is_stack_read;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2763_c22_1c3f] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2763_c22_1c3f_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2753_c32_0eea_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2753_c32_ea0a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_0b62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c6_b9f6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2717_c2_8f8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c6_b9f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c2_8f8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c6_b9f6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2717_c2_8f8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c6_b9f6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2717_c2_8f8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c6_b9f6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2717_c2_8f8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c6_b9f6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2717_c2_8f8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c6_b9f6_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2717_c2_8f8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c6_b9f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c2_8f8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c6_b9f6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c2_8f8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c6_b9f6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2717_c2_8f8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c6_b9f6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2723_c7_b403_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_9b9e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_b403_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_9b9e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2723_c7_b403_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_9b9e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c7_b403_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_9b9e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2723_c7_b403_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_9b9e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2723_c7_b403_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_9b9e_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2723_c7_b403_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_9b9e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_b403_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_9b9e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_b403_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_9b9e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2723_c7_b403_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_9b9e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2726_c7_584d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_d953_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_584d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_d953_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2726_c7_584d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_d953_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2726_c7_584d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_d953_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2726_c7_584d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_d953_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2726_c7_584d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_d953_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2726_c7_584d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_d953_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_584d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_d953_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_584d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_d953_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2726_c7_584d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_d953_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2731_c7_5dc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_ebaf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_5dc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_ebaf_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2731_c7_5dc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_ebaf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_5dc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_ebaf_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2731_c7_5dc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_ebaf_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2731_c7_5dc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_ebaf_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2731_c7_5dc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_ebaf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_5dc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_ebaf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_5dc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_ebaf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2731_c7_5dc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_ebaf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2734_c7_95fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a448_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_95fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a448_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2734_c7_95fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a448_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2734_c7_95fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a448_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2734_c7_95fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a448_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2734_c7_95fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a448_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2734_c7_95fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a448_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_95fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a448_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_95fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a448_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2734_c7_95fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_a448_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2738_c7_df52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_e56c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_df52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_e56c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2738_c7_df52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_e56c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2738_c7_df52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_e56c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2738_c7_df52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_e56c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2738_c7_df52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_e56c_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2738_c7_df52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_e56c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2738_c7_df52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_e56c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_df52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_e56c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2741_c7_1161_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_f284_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_1161_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_f284_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2741_c7_1161_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_f284_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2741_c7_1161_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_f284_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2741_c7_1161_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_f284_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2741_c7_1161_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_f284_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2741_c7_1161_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_f284_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_1161_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_f284_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_1161_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_f284_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2746_c7_5364_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_5f6e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_5364_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_5f6e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2746_c7_5364_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_5f6e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_5364_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_5f6e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2746_c7_5364_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_5f6e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2746_c7_5364_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_5f6e_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2746_c7_5364_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_5f6e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_5364_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_5f6e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_5364_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_5f6e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2749_c7_3685_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_c373_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_3685_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_c373_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2749_c7_3685_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_c373_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2749_c7_3685_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_c373_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2749_c7_3685_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_c373_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2749_c7_3685_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_c373_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2749_c7_3685_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_c373_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_3685_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_c373_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_af18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_aa68_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2755_c7_af18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_aa68_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_af18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_aa68_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2755_c7_af18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_aa68_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2755_c7_af18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_aa68_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_f5f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_42b9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2761_c7_f5f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_42b9_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2761_c7_f5f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_42b9_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2761_c7_f5f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_42b9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_8e47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_b55d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2765_c7_8e47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_b55d_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l2762_c3_5ab6 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2762_c21_1136_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l2735_c3_f825_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2727_l2742_l2735_l2750_DUPLICATE_a986_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2750_c3_b3be_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2727_l2742_l2735_l2750_DUPLICATE_a986_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2728_l2743_DUPLICATE_6daf_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2727_l2742_l2735_l2750_DUPLICATE_a986_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2761_c7_f5f7_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2763_c22_1c3f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c2_8f8f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2741_l2738_l2734_l2731_l2726_l2749_l2723_l2746_l2717_DUPLICATE_d3e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_b403_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2741_l2738_l2734_l2731_l2726_l2749_l2723_l2746_l2717_DUPLICATE_d3e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_584d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2741_l2738_l2734_l2731_l2726_l2749_l2723_l2746_l2717_DUPLICATE_d3e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_5dc9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2741_l2738_l2734_l2731_l2726_l2749_l2723_l2746_l2717_DUPLICATE_d3e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_95fa_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2741_l2738_l2734_l2731_l2726_l2749_l2723_l2746_l2717_DUPLICATE_d3e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2738_c7_df52_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2741_l2738_l2734_l2731_l2726_l2749_l2723_l2746_l2717_DUPLICATE_d3e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_1161_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2741_l2738_l2734_l2731_l2726_l2749_l2723_l2746_l2717_DUPLICATE_d3e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_5364_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2741_l2738_l2734_l2731_l2726_l2749_l2723_l2746_l2717_DUPLICATE_d3e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_3685_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2741_l2738_l2734_l2731_l2726_l2749_l2723_l2746_l2717_DUPLICATE_d3e8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2717_c2_8f8f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2741_l2738_l2734_l2761_l2731_l2726_l2749_l2723_l2746_l2717_DUPLICATE_4cc7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2723_c7_b403_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2741_l2738_l2734_l2761_l2731_l2726_l2749_l2723_l2746_l2717_DUPLICATE_4cc7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2726_c7_584d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2741_l2738_l2734_l2761_l2731_l2726_l2749_l2723_l2746_l2717_DUPLICATE_4cc7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2731_c7_5dc9_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2741_l2738_l2734_l2761_l2731_l2726_l2749_l2723_l2746_l2717_DUPLICATE_4cc7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2734_c7_95fa_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2741_l2738_l2734_l2761_l2731_l2726_l2749_l2723_l2746_l2717_DUPLICATE_4cc7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2738_c7_df52_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2741_l2738_l2734_l2761_l2731_l2726_l2749_l2723_l2746_l2717_DUPLICATE_4cc7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2741_c7_1161_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2741_l2738_l2734_l2761_l2731_l2726_l2749_l2723_l2746_l2717_DUPLICATE_4cc7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2746_c7_5364_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2741_l2738_l2734_l2761_l2731_l2726_l2749_l2723_l2746_l2717_DUPLICATE_4cc7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2749_c7_3685_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2741_l2738_l2734_l2761_l2731_l2726_l2749_l2723_l2746_l2717_DUPLICATE_4cc7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2761_c7_f5f7_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2741_l2738_l2734_l2761_l2731_l2726_l2749_l2723_l2746_l2717_DUPLICATE_4cc7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_b403_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2741_l2738_l2765_l2734_l2761_l2731_l2755_l2726_l2749_l2723_l2746_DUPLICATE_f528_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_584d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2741_l2738_l2765_l2734_l2761_l2731_l2755_l2726_l2749_l2723_l2746_DUPLICATE_f528_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_5dc9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2741_l2738_l2765_l2734_l2761_l2731_l2755_l2726_l2749_l2723_l2746_DUPLICATE_f528_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_95fa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2741_l2738_l2765_l2734_l2761_l2731_l2755_l2726_l2749_l2723_l2746_DUPLICATE_f528_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_df52_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2741_l2738_l2765_l2734_l2761_l2731_l2755_l2726_l2749_l2723_l2746_DUPLICATE_f528_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_1161_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2741_l2738_l2765_l2734_l2761_l2731_l2755_l2726_l2749_l2723_l2746_DUPLICATE_f528_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_5364_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2741_l2738_l2765_l2734_l2761_l2731_l2755_l2726_l2749_l2723_l2746_DUPLICATE_f528_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_3685_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2741_l2738_l2765_l2734_l2761_l2731_l2755_l2726_l2749_l2723_l2746_DUPLICATE_f528_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_af18_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2741_l2738_l2765_l2734_l2761_l2731_l2755_l2726_l2749_l2723_l2746_DUPLICATE_f528_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_f5f7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2741_l2738_l2765_l2734_l2761_l2731_l2755_l2726_l2749_l2723_l2746_DUPLICATE_f528_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_8e47_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2741_l2738_l2765_l2734_l2761_l2731_l2755_l2726_l2749_l2723_l2746_DUPLICATE_f528_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2717_c2_8f8f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2741_l2738_l2765_l2734_l2761_l2731_l2726_l2749_l2723_l2746_l2717_DUPLICATE_fec0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2723_c7_b403_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2741_l2738_l2765_l2734_l2761_l2731_l2726_l2749_l2723_l2746_l2717_DUPLICATE_fec0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2726_c7_584d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2741_l2738_l2765_l2734_l2761_l2731_l2726_l2749_l2723_l2746_l2717_DUPLICATE_fec0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2731_c7_5dc9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2741_l2738_l2765_l2734_l2761_l2731_l2726_l2749_l2723_l2746_l2717_DUPLICATE_fec0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2734_c7_95fa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2741_l2738_l2765_l2734_l2761_l2731_l2726_l2749_l2723_l2746_l2717_DUPLICATE_fec0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2738_c7_df52_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2741_l2738_l2765_l2734_l2761_l2731_l2726_l2749_l2723_l2746_l2717_DUPLICATE_fec0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2741_c7_1161_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2741_l2738_l2765_l2734_l2761_l2731_l2726_l2749_l2723_l2746_l2717_DUPLICATE_fec0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2746_c7_5364_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2741_l2738_l2765_l2734_l2761_l2731_l2726_l2749_l2723_l2746_l2717_DUPLICATE_fec0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2749_c7_3685_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2741_l2738_l2765_l2734_l2761_l2731_l2726_l2749_l2723_l2746_l2717_DUPLICATE_fec0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2761_c7_f5f7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2741_l2738_l2765_l2734_l2761_l2731_l2726_l2749_l2723_l2746_l2717_DUPLICATE_fec0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2765_c7_8e47_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2741_l2738_l2765_l2734_l2761_l2731_l2726_l2749_l2723_l2746_l2717_DUPLICATE_fec0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2717_c2_8f8f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2741_l2738_l2734_l2731_l2755_l2726_l2723_l2746_l2717_DUPLICATE_f742_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c7_b403_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2741_l2738_l2734_l2731_l2755_l2726_l2723_l2746_l2717_DUPLICATE_f742_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2726_c7_584d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2741_l2738_l2734_l2731_l2755_l2726_l2723_l2746_l2717_DUPLICATE_f742_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_5dc9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2741_l2738_l2734_l2731_l2755_l2726_l2723_l2746_l2717_DUPLICATE_f742_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2734_c7_95fa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2741_l2738_l2734_l2731_l2755_l2726_l2723_l2746_l2717_DUPLICATE_f742_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2738_c7_df52_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2741_l2738_l2734_l2731_l2755_l2726_l2723_l2746_l2717_DUPLICATE_f742_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2741_c7_1161_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2741_l2738_l2734_l2731_l2755_l2726_l2723_l2746_l2717_DUPLICATE_f742_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_5364_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2741_l2738_l2734_l2731_l2755_l2726_l2723_l2746_l2717_DUPLICATE_f742_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_af18_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2741_l2738_l2734_l2731_l2755_l2726_l2723_l2746_l2717_DUPLICATE_f742_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2723_c7_b403_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2741_l2738_l2734_l2731_l2726_l2749_l2723_l2746_DUPLICATE_9256_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2726_c7_584d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2741_l2738_l2734_l2731_l2726_l2749_l2723_l2746_DUPLICATE_9256_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2731_c7_5dc9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2741_l2738_l2734_l2731_l2726_l2749_l2723_l2746_DUPLICATE_9256_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2734_c7_95fa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2741_l2738_l2734_l2731_l2726_l2749_l2723_l2746_DUPLICATE_9256_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2738_c7_df52_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2741_l2738_l2734_l2731_l2726_l2749_l2723_l2746_DUPLICATE_9256_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2741_c7_1161_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2741_l2738_l2734_l2731_l2726_l2749_l2723_l2746_DUPLICATE_9256_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2746_c7_5364_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2741_l2738_l2734_l2731_l2726_l2749_l2723_l2746_DUPLICATE_9256_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2749_c7_3685_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2741_l2738_l2734_l2731_l2726_l2749_l2723_l2746_DUPLICATE_9256_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2717_c2_8f8f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2741_l2738_l2734_l2761_l2731_l2726_l2749_l2723_l2746_l2717_DUPLICATE_58db_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2723_c7_b403_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2741_l2738_l2734_l2761_l2731_l2726_l2749_l2723_l2746_l2717_DUPLICATE_58db_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2726_c7_584d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2741_l2738_l2734_l2761_l2731_l2726_l2749_l2723_l2746_l2717_DUPLICATE_58db_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2731_c7_5dc9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2741_l2738_l2734_l2761_l2731_l2726_l2749_l2723_l2746_l2717_DUPLICATE_58db_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2734_c7_95fa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2741_l2738_l2734_l2761_l2731_l2726_l2749_l2723_l2746_l2717_DUPLICATE_58db_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2738_c7_df52_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2741_l2738_l2734_l2761_l2731_l2726_l2749_l2723_l2746_l2717_DUPLICATE_58db_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2741_c7_1161_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2741_l2738_l2734_l2761_l2731_l2726_l2749_l2723_l2746_l2717_DUPLICATE_58db_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2746_c7_5364_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2741_l2738_l2734_l2761_l2731_l2726_l2749_l2723_l2746_l2717_DUPLICATE_58db_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2749_c7_3685_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2741_l2738_l2734_l2761_l2731_l2726_l2749_l2723_l2746_l2717_DUPLICATE_58db_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2761_c7_f5f7_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2741_l2738_l2734_l2761_l2731_l2726_l2749_l2723_l2746_l2717_DUPLICATE_58db_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_5364_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2746_c7_5364_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2761_c7_f5f7_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l2762_c3_5ab6;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2765_c7_8e47] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2765_c7_8e47_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2765_c7_8e47_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2765_c7_8e47_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2765_c7_8e47_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2765_c7_8e47_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2765_c7_8e47_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2765_c7_8e47_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2765_c7_8e47_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2765_c7_8e47] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_8e47_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_8e47_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_8e47_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_8e47_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_8e47_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_8e47_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_8e47_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_8e47_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2761_c7_f5f7] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2761_c7_f5f7_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2761_c7_f5f7_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2761_c7_f5f7_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2761_c7_f5f7_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2761_c7_f5f7_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2761_c7_f5f7_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2761_c7_f5f7_return_output := result_ram_value_MUX_uxn_opcodes_h_l2761_c7_f5f7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2755_c7_af18] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_af18_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_af18_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_af18_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_af18_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_af18_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_af18_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_af18_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_af18_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2728_l2743_DUPLICATE_6daf LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2728_l2743_DUPLICATE_6daf_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2728_l2743_DUPLICATE_6daf_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2728_l2743_DUPLICATE_6daf_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2728_l2743_DUPLICATE_6daf_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2717_c1_0b62] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_0b62_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_0b62_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_0b62_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_0b62_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_0b62_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_0b62_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_0b62_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_0b62_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2753_c32_0eea] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2753_c32_0eea_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2753_c32_0eea_left;
     BIN_OP_GT_uxn_opcodes_h_l2753_c32_0eea_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2753_c32_0eea_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2753_c32_0eea_return_output := BIN_OP_GT_uxn_opcodes_h_l2753_c32_0eea_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2761_c7_f5f7] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2761_c7_f5f7_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2761_c7_f5f7_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2761_c7_f5f7_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2761_c7_f5f7_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2761_c7_f5f7_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2761_c7_f5f7_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2761_c7_f5f7_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2761_c7_f5f7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2746_c7_5364] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_5364_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_5364_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_5364_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_5364_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_5364_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_5364_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_5364_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_5364_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2750_c3_b3be] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2750_c3_b3be_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2750_c3_b3be_left;
     BIN_OP_OR_uxn_opcodes_h_l2750_c3_b3be_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2750_c3_b3be_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2750_c3_b3be_return_output := BIN_OP_OR_uxn_opcodes_h_l2750_c3_b3be_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2735_c3_f825] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2735_c3_f825_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2735_c3_f825_left;
     BIN_OP_OR_uxn_opcodes_h_l2735_c3_f825_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2735_c3_f825_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2735_c3_f825_return_output := BIN_OP_OR_uxn_opcodes_h_l2735_c3_f825_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2759_c22_7dea] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2759_c22_7dea_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2759_c32_c2a8_return_output);

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2749_c7_3685] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2749_c7_3685_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2749_c7_3685_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2749_c7_3685_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2749_c7_3685_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2749_c7_3685_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2749_c7_3685_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2749_c7_3685_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2749_c7_3685_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2753_c32_1954_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2753_c32_0eea_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2734_c7_95fa_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2735_c3_f825_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2749_c7_3685_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2750_c3_b3be_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2755_c7_af18_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2759_c22_7dea_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2741_c7_1161_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2728_l2743_DUPLICATE_6daf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2726_c7_584d_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2728_l2743_DUPLICATE_6daf_return_output;
     VAR_printf_uxn_opcodes_h_l2718_c3_2f5e_uxn_opcodes_h_l2718_c3_2f5e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_0b62_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_f5f7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_8e47_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2761_c7_f5f7_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2765_c7_8e47_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2749_c7_3685_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2755_c7_af18_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2746_c7_5364_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2749_c7_3685_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2755_c7_af18_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2761_c7_f5f7_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2755_c7_af18_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2761_c7_f5f7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_1161_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2746_c7_5364_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2741_c7_1161] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_1161_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_1161_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_1161_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_1161_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_1161_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_1161_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_1161_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_1161_return_output;

     -- printf_uxn_opcodes_h_l2718_c3_2f5e[uxn_opcodes_h_l2718_c3_2f5e] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2718_c3_2f5e_uxn_opcodes_h_l2718_c3_2f5e_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2718_c3_2f5e_uxn_opcodes_h_l2718_c3_2f5e_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2749_c7_3685] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2749_c7_3685_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2749_c7_3685_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2749_c7_3685_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2749_c7_3685_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2749_c7_3685_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2749_c7_3685_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2749_c7_3685_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2749_c7_3685_return_output;

     -- n16_MUX[uxn_opcodes_h_l2749_c7_3685] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2749_c7_3685_cond <= VAR_n16_MUX_uxn_opcodes_h_l2749_c7_3685_cond;
     n16_MUX_uxn_opcodes_h_l2749_c7_3685_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2749_c7_3685_iftrue;
     n16_MUX_uxn_opcodes_h_l2749_c7_3685_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2749_c7_3685_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2749_c7_3685_return_output := n16_MUX_uxn_opcodes_h_l2749_c7_3685_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2755_c7_af18] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2755_c7_af18_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2755_c7_af18_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2755_c7_af18_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2755_c7_af18_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2755_c7_af18_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2755_c7_af18_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2755_c7_af18_return_output := result_ram_value_MUX_uxn_opcodes_h_l2755_c7_af18_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2761_c7_f5f7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_f5f7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_f5f7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_f5f7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_f5f7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_f5f7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_f5f7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_f5f7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_f5f7_return_output;

     -- MUX[uxn_opcodes_h_l2753_c32_1954] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2753_c32_1954_cond <= VAR_MUX_uxn_opcodes_h_l2753_c32_1954_cond;
     MUX_uxn_opcodes_h_l2753_c32_1954_iftrue <= VAR_MUX_uxn_opcodes_h_l2753_c32_1954_iftrue;
     MUX_uxn_opcodes_h_l2753_c32_1954_iffalse <= VAR_MUX_uxn_opcodes_h_l2753_c32_1954_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2753_c32_1954_return_output := MUX_uxn_opcodes_h_l2753_c32_1954_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2761_c7_f5f7] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2761_c7_f5f7_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2761_c7_f5f7_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2761_c7_f5f7_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2761_c7_f5f7_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2761_c7_f5f7_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2761_c7_f5f7_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2761_c7_f5f7_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2761_c7_f5f7_return_output;

     -- t16_MUX[uxn_opcodes_h_l2734_c7_95fa] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2734_c7_95fa_cond <= VAR_t16_MUX_uxn_opcodes_h_l2734_c7_95fa_cond;
     t16_MUX_uxn_opcodes_h_l2734_c7_95fa_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2734_c7_95fa_iftrue;
     t16_MUX_uxn_opcodes_h_l2734_c7_95fa_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2734_c7_95fa_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output := t16_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2746_c7_5364] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2746_c7_5364_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2746_c7_5364_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2746_c7_5364_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2746_c7_5364_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2746_c7_5364_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2746_c7_5364_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2746_c7_5364_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2746_c7_5364_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2755_c7_af18] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2755_c7_af18_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2755_c7_af18_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2755_c7_af18_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2755_c7_af18_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2755_c7_af18_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2755_c7_af18_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2755_c7_af18_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2755_c7_af18_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_3685_iftrue := VAR_MUX_uxn_opcodes_h_l2753_c32_1954_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2746_c7_5364_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2749_c7_3685_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_af18_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_f5f7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2755_c7_af18_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2761_c7_f5f7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_5364_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2749_c7_3685_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2741_c7_1161_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2746_c7_5364_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2749_c7_3685_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2755_c7_af18_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2749_c7_3685_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2755_c7_af18_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_df52_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_1161_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2731_c7_5dc9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2755_c7_af18] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_af18_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_af18_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_af18_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_af18_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_af18_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_af18_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_af18_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_af18_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2755_c7_af18] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2755_c7_af18_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2755_c7_af18_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2755_c7_af18_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2755_c7_af18_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2755_c7_af18_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2755_c7_af18_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2755_c7_af18_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2755_c7_af18_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2749_c7_3685] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2749_c7_3685_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2749_c7_3685_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2749_c7_3685_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2749_c7_3685_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2749_c7_3685_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2749_c7_3685_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2749_c7_3685_return_output := result_ram_value_MUX_uxn_opcodes_h_l2749_c7_3685_return_output;

     -- t16_MUX[uxn_opcodes_h_l2731_c7_5dc9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2731_c7_5dc9_cond <= VAR_t16_MUX_uxn_opcodes_h_l2731_c7_5dc9_cond;
     t16_MUX_uxn_opcodes_h_l2731_c7_5dc9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2731_c7_5dc9_iftrue;
     t16_MUX_uxn_opcodes_h_l2731_c7_5dc9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2731_c7_5dc9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output := t16_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2738_c7_df52] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_df52_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_df52_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_df52_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_df52_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_df52_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_df52_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_df52_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_df52_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2749_c7_3685] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2749_c7_3685_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2749_c7_3685_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2749_c7_3685_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2749_c7_3685_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2749_c7_3685_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2749_c7_3685_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2749_c7_3685_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2749_c7_3685_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2746_c7_5364] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_5364_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_5364_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_5364_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_5364_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_5364_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_5364_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_5364_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_5364_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2749_c7_3685] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_3685_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_3685_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_3685_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_3685_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_3685_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_3685_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_3685_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_3685_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2741_c7_1161] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2741_c7_1161_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2741_c7_1161_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2741_c7_1161_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2741_c7_1161_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2741_c7_1161_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2741_c7_1161_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2741_c7_1161_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2741_c7_1161_return_output;

     -- n16_MUX[uxn_opcodes_h_l2746_c7_5364] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2746_c7_5364_cond <= VAR_n16_MUX_uxn_opcodes_h_l2746_c7_5364_cond;
     n16_MUX_uxn_opcodes_h_l2746_c7_5364_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2746_c7_5364_iftrue;
     n16_MUX_uxn_opcodes_h_l2746_c7_5364_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2746_c7_5364_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2746_c7_5364_return_output := n16_MUX_uxn_opcodes_h_l2746_c7_5364_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l2741_c7_1161_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2746_c7_5364_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_3685_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_af18_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2749_c7_3685_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2755_c7_af18_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2741_c7_1161_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2746_c7_5364_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2738_c7_df52_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2741_c7_1161_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2746_c7_5364_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2749_c7_3685_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2746_c7_5364_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2749_c7_3685_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_5364_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_3685_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_95fa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_df52_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2726_c7_584d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output;
     -- t16_MUX[uxn_opcodes_h_l2726_c7_584d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2726_c7_584d_cond <= VAR_t16_MUX_uxn_opcodes_h_l2726_c7_584d_cond;
     t16_MUX_uxn_opcodes_h_l2726_c7_584d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2726_c7_584d_iftrue;
     t16_MUX_uxn_opcodes_h_l2726_c7_584d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2726_c7_584d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2726_c7_584d_return_output := t16_MUX_uxn_opcodes_h_l2726_c7_584d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2734_c7_95fa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_95fa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_95fa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_95fa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_95fa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_95fa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_95fa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output;

     -- n16_MUX[uxn_opcodes_h_l2741_c7_1161] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2741_c7_1161_cond <= VAR_n16_MUX_uxn_opcodes_h_l2741_c7_1161_cond;
     n16_MUX_uxn_opcodes_h_l2741_c7_1161_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2741_c7_1161_iftrue;
     n16_MUX_uxn_opcodes_h_l2741_c7_1161_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2741_c7_1161_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2741_c7_1161_return_output := n16_MUX_uxn_opcodes_h_l2741_c7_1161_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2749_c7_3685] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2749_c7_3685_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2749_c7_3685_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2749_c7_3685_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2749_c7_3685_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2749_c7_3685_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2749_c7_3685_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2749_c7_3685_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2749_c7_3685_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2746_c7_5364] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2746_c7_5364_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2746_c7_5364_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2746_c7_5364_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2746_c7_5364_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2746_c7_5364_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2746_c7_5364_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2746_c7_5364_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2746_c7_5364_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2749_c7_3685] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_3685_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_3685_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_3685_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_3685_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_3685_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_3685_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_3685_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_3685_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2741_c7_1161] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2741_c7_1161_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2741_c7_1161_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2741_c7_1161_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2741_c7_1161_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2741_c7_1161_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2741_c7_1161_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2741_c7_1161_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2741_c7_1161_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2746_c7_5364] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_5364_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_5364_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_5364_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_5364_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_5364_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_5364_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_5364_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_5364_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2746_c7_5364] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2746_c7_5364_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2746_c7_5364_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2746_c7_5364_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2746_c7_5364_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2746_c7_5364_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2746_c7_5364_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2746_c7_5364_return_output := result_ram_value_MUX_uxn_opcodes_h_l2746_c7_5364_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2738_c7_df52] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2738_c7_df52_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2738_c7_df52_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2738_c7_df52_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2738_c7_df52_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2738_c7_df52_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2738_c7_df52_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2738_c7_df52_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2738_c7_df52_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2738_c7_df52_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2741_c7_1161_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_5364_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_3685_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2746_c7_5364_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2749_c7_3685_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2738_c7_df52_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2741_c7_1161_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2734_c7_95fa_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2738_c7_df52_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2741_c7_1161_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2746_c7_5364_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2741_c7_1161_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2746_c7_5364_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_1161_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2746_c7_5364_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_5dc9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2723_c7_b403_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2726_c7_584d_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2738_c7_df52] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2738_c7_df52_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2738_c7_df52_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2738_c7_df52_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2738_c7_df52_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2738_c7_df52_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2738_c7_df52_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2738_c7_df52_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2738_c7_df52_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2741_c7_1161] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2741_c7_1161_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2741_c7_1161_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2741_c7_1161_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2741_c7_1161_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2741_c7_1161_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2741_c7_1161_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2741_c7_1161_return_output := result_ram_value_MUX_uxn_opcodes_h_l2741_c7_1161_return_output;

     -- t16_MUX[uxn_opcodes_h_l2723_c7_b403] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2723_c7_b403_cond <= VAR_t16_MUX_uxn_opcodes_h_l2723_c7_b403_cond;
     t16_MUX_uxn_opcodes_h_l2723_c7_b403_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2723_c7_b403_iftrue;
     t16_MUX_uxn_opcodes_h_l2723_c7_b403_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2723_c7_b403_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2723_c7_b403_return_output := t16_MUX_uxn_opcodes_h_l2723_c7_b403_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2731_c7_5dc9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_5dc9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_5dc9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_5dc9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_5dc9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_5dc9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_5dc9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output;

     -- n16_MUX[uxn_opcodes_h_l2738_c7_df52] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2738_c7_df52_cond <= VAR_n16_MUX_uxn_opcodes_h_l2738_c7_df52_cond;
     n16_MUX_uxn_opcodes_h_l2738_c7_df52_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2738_c7_df52_iftrue;
     n16_MUX_uxn_opcodes_h_l2738_c7_df52_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2738_c7_df52_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2738_c7_df52_return_output := n16_MUX_uxn_opcodes_h_l2738_c7_df52_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2734_c7_95fa] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2734_c7_95fa_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2734_c7_95fa_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2734_c7_95fa_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2734_c7_95fa_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2734_c7_95fa_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2734_c7_95fa_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2741_c7_1161] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_1161_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_1161_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_1161_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_1161_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_1161_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_1161_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_1161_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_1161_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2746_c7_5364] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2746_c7_5364_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2746_c7_5364_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2746_c7_5364_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2746_c7_5364_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2746_c7_5364_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2746_c7_5364_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2746_c7_5364_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2746_c7_5364_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2741_c7_1161] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2741_c7_1161_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2741_c7_1161_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2741_c7_1161_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2741_c7_1161_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2741_c7_1161_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2741_c7_1161_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2741_c7_1161_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2741_c7_1161_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2746_c7_5364] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_5364_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_5364_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_5364_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_5364_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_5364_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_5364_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_5364_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_5364_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2734_c7_95fa_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2738_c7_df52_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_1161_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2746_c7_5364_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2741_c7_1161_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2746_c7_5364_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2734_c7_95fa_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2738_c7_df52_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2731_c7_5dc9_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2738_c7_df52_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2741_c7_1161_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2738_c7_df52_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2741_c7_1161_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2738_c7_df52_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_1161_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_584d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2717_c2_8f8f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2723_c7_b403_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2738_c7_df52] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2738_c7_df52_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2738_c7_df52_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2738_c7_df52_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2738_c7_df52_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2738_c7_df52_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2738_c7_df52_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2738_c7_df52_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2738_c7_df52_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2738_c7_df52] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2738_c7_df52_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2738_c7_df52_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2738_c7_df52_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2738_c7_df52_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2738_c7_df52_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2738_c7_df52_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2738_c7_df52_return_output := result_ram_value_MUX_uxn_opcodes_h_l2738_c7_df52_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2726_c7_584d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_584d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_584d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_584d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_584d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_584d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_584d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_584d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_584d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2734_c7_95fa] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2734_c7_95fa_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2734_c7_95fa_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2734_c7_95fa_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2734_c7_95fa_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2734_c7_95fa_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2734_c7_95fa_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2738_c7_df52] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2738_c7_df52_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2738_c7_df52_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2738_c7_df52_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2738_c7_df52_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2738_c7_df52_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2738_c7_df52_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2738_c7_df52_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2738_c7_df52_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2731_c7_5dc9] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2731_c7_5dc9_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2731_c7_5dc9_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2731_c7_5dc9_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2731_c7_5dc9_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2731_c7_5dc9_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2731_c7_5dc9_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2741_c7_1161] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_1161_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_1161_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_1161_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_1161_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_1161_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_1161_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_1161_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_1161_return_output;

     -- n16_MUX[uxn_opcodes_h_l2734_c7_95fa] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2734_c7_95fa_cond <= VAR_n16_MUX_uxn_opcodes_h_l2734_c7_95fa_cond;
     n16_MUX_uxn_opcodes_h_l2734_c7_95fa_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2734_c7_95fa_iftrue;
     n16_MUX_uxn_opcodes_h_l2734_c7_95fa_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2734_c7_95fa_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output := n16_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output;

     -- t16_MUX[uxn_opcodes_h_l2717_c2_8f8f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2717_c2_8f8f_cond <= VAR_t16_MUX_uxn_opcodes_h_l2717_c2_8f8f_cond;
     t16_MUX_uxn_opcodes_h_l2717_c2_8f8f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2717_c2_8f8f_iftrue;
     t16_MUX_uxn_opcodes_h_l2717_c2_8f8f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2717_c2_8f8f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output := t16_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2741_c7_1161] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2741_c7_1161_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2741_c7_1161_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2741_c7_1161_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2741_c7_1161_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2741_c7_1161_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2741_c7_1161_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2741_c7_1161_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2741_c7_1161_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2731_c7_5dc9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_df52_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_1161_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2738_c7_df52_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2741_c7_1161_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_5dc9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2726_c7_584d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2734_c7_95fa_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2738_c7_df52_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2734_c7_95fa_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2738_c7_df52_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_95fa_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2738_c7_df52_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_b403_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_584d_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output;
     -- n16_MUX[uxn_opcodes_h_l2731_c7_5dc9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2731_c7_5dc9_cond <= VAR_n16_MUX_uxn_opcodes_h_l2731_c7_5dc9_cond;
     n16_MUX_uxn_opcodes_h_l2731_c7_5dc9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2731_c7_5dc9_iftrue;
     n16_MUX_uxn_opcodes_h_l2731_c7_5dc9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2731_c7_5dc9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output := n16_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2723_c7_b403] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_b403_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_b403_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_b403_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_b403_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_b403_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_b403_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_b403_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_b403_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2734_c7_95fa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_95fa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_95fa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_95fa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_95fa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_95fa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_95fa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2734_c7_95fa] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2734_c7_95fa_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2734_c7_95fa_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2734_c7_95fa_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2734_c7_95fa_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2734_c7_95fa_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2734_c7_95fa_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2734_c7_95fa] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2734_c7_95fa_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2734_c7_95fa_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2734_c7_95fa_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2734_c7_95fa_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2734_c7_95fa_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2734_c7_95fa_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output := result_ram_value_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2726_c7_584d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2726_c7_584d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2726_c7_584d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2726_c7_584d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2726_c7_584d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2726_c7_584d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2726_c7_584d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2726_c7_584d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2726_c7_584d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2731_c7_5dc9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_5dc9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_5dc9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_5dc9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_5dc9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_5dc9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_5dc9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2738_c7_df52] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2738_c7_df52_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2738_c7_df52_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2738_c7_df52_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2738_c7_df52_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2738_c7_df52_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2738_c7_df52_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2738_c7_df52_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2738_c7_df52_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2738_c7_df52] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_df52_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_df52_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_df52_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_df52_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_df52_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_df52_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_df52_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_df52_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2726_c7_584d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_95fa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_df52_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2734_c7_95fa_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2738_c7_df52_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2726_c7_584d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2723_c7_b403_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2726_c7_584d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2731_c7_5dc9_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2731_c7_5dc9_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_5dc9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c2_8f8f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_b403_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2717_c2_8f8f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c2_8f8f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c2_8f8f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c2_8f8f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c2_8f8f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c2_8f8f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c2_8f8f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output;

     -- n16_MUX[uxn_opcodes_h_l2726_c7_584d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2726_c7_584d_cond <= VAR_n16_MUX_uxn_opcodes_h_l2726_c7_584d_cond;
     n16_MUX_uxn_opcodes_h_l2726_c7_584d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2726_c7_584d_iftrue;
     n16_MUX_uxn_opcodes_h_l2726_c7_584d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2726_c7_584d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2726_c7_584d_return_output := n16_MUX_uxn_opcodes_h_l2726_c7_584d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2723_c7_b403] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2723_c7_b403_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2723_c7_b403_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2723_c7_b403_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2723_c7_b403_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2723_c7_b403_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2723_c7_b403_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2723_c7_b403_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2723_c7_b403_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2731_c7_5dc9] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2731_c7_5dc9_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2731_c7_5dc9_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2731_c7_5dc9_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2731_c7_5dc9_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2731_c7_5dc9_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2731_c7_5dc9_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2731_c7_5dc9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_5dc9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_5dc9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_5dc9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_5dc9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_5dc9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_5dc9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2726_c7_584d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2726_c7_584d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2726_c7_584d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2726_c7_584d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2726_c7_584d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2726_c7_584d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2726_c7_584d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2726_c7_584d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2726_c7_584d_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2734_c7_95fa] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2734_c7_95fa_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2734_c7_95fa_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2734_c7_95fa_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2734_c7_95fa_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2734_c7_95fa_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2734_c7_95fa_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2734_c7_95fa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_95fa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_95fa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_95fa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_95fa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_95fa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_95fa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2731_c7_5dc9] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2731_c7_5dc9_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2731_c7_5dc9_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2731_c7_5dc9_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2731_c7_5dc9_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2731_c7_5dc9_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2731_c7_5dc9_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output := result_ram_value_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2723_c7_b403_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2726_c7_584d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_5dc9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2731_c7_5dc9_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2734_c7_95fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c7_b403_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2726_c7_584d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2717_c2_8f8f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2723_c7_b403_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2726_c7_584d_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2726_c7_584d_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_584d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2726_c7_584d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_584d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_584d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_584d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_584d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_584d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_584d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_584d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_584d_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2726_c7_584d] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2726_c7_584d_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2726_c7_584d_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2726_c7_584d_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2726_c7_584d_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2726_c7_584d_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2726_c7_584d_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2726_c7_584d_return_output := result_ram_value_MUX_uxn_opcodes_h_l2726_c7_584d_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2731_c7_5dc9] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2731_c7_5dc9_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2731_c7_5dc9_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2731_c7_5dc9_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2731_c7_5dc9_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2731_c7_5dc9_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2731_c7_5dc9_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2717_c2_8f8f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2717_c2_8f8f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2717_c2_8f8f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2717_c2_8f8f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2717_c2_8f8f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2717_c2_8f8f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2717_c2_8f8f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output;

     -- n16_MUX[uxn_opcodes_h_l2723_c7_b403] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2723_c7_b403_cond <= VAR_n16_MUX_uxn_opcodes_h_l2723_c7_b403_cond;
     n16_MUX_uxn_opcodes_h_l2723_c7_b403_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2723_c7_b403_iftrue;
     n16_MUX_uxn_opcodes_h_l2723_c7_b403_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2723_c7_b403_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2723_c7_b403_return_output := n16_MUX_uxn_opcodes_h_l2723_c7_b403_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2731_c7_5dc9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_5dc9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_5dc9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_5dc9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_5dc9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_5dc9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_5dc9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2723_c7_b403] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c7_b403_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c7_b403_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c7_b403_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c7_b403_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c7_b403_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c7_b403_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c7_b403_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c7_b403_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2726_c7_584d] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2726_c7_584d_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2726_c7_584d_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2726_c7_584d_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2726_c7_584d_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2726_c7_584d_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2726_c7_584d_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2726_c7_584d_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2726_c7_584d_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2717_c2_8f8f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2723_c7_b403_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_584d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2726_c7_584d_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2731_c7_5dc9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2717_c2_8f8f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2723_c7_b403_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2723_c7_b403_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2726_c7_584d_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2723_c7_b403_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2726_c7_584d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_b403_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_584d_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2723_c7_b403] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_b403_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_b403_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_b403_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_b403_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_b403_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_b403_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_b403_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_b403_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2726_c7_584d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_584d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_584d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_584d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_584d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_584d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_584d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_584d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_584d_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2726_c7_584d] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2726_c7_584d_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2726_c7_584d_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2726_c7_584d_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2726_c7_584d_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2726_c7_584d_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2726_c7_584d_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2726_c7_584d_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2726_c7_584d_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2723_c7_b403] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2723_c7_b403_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2723_c7_b403_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2723_c7_b403_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2723_c7_b403_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2723_c7_b403_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2723_c7_b403_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2723_c7_b403_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2723_c7_b403_return_output;

     -- n16_MUX[uxn_opcodes_h_l2717_c2_8f8f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2717_c2_8f8f_cond <= VAR_n16_MUX_uxn_opcodes_h_l2717_c2_8f8f_cond;
     n16_MUX_uxn_opcodes_h_l2717_c2_8f8f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2717_c2_8f8f_iftrue;
     n16_MUX_uxn_opcodes_h_l2717_c2_8f8f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2717_c2_8f8f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output := n16_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2723_c7_b403] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2723_c7_b403_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2723_c7_b403_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2723_c7_b403_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2723_c7_b403_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2723_c7_b403_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2723_c7_b403_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2723_c7_b403_return_output := result_ram_value_MUX_uxn_opcodes_h_l2723_c7_b403_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2717_c2_8f8f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2717_c2_8f8f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2717_c2_8f8f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2717_c2_8f8f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2717_c2_8f8f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2717_c2_8f8f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2717_c2_8f8f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_b403_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_584d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2723_c7_b403_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2726_c7_584d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2717_c2_8f8f_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2723_c7_b403_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2717_c2_8f8f_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2723_c7_b403_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c2_8f8f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_b403_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l2717_c2_8f8f] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2717_c2_8f8f_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2717_c2_8f8f_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2717_c2_8f8f_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2717_c2_8f8f_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2717_c2_8f8f_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2717_c2_8f8f_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2717_c2_8f8f] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2717_c2_8f8f_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2717_c2_8f8f_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2717_c2_8f8f_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2717_c2_8f8f_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2717_c2_8f8f_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2717_c2_8f8f_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output := result_ram_value_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2723_c7_b403] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_b403_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_b403_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_b403_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_b403_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_b403_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_b403_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_b403_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_b403_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2723_c7_b403] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2723_c7_b403_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2723_c7_b403_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2723_c7_b403_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2723_c7_b403_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2723_c7_b403_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2723_c7_b403_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2723_c7_b403_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2723_c7_b403_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2717_c2_8f8f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c2_8f8f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c2_8f8f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c2_8f8f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c2_8f8f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c2_8f8f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c2_8f8f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c2_8f8f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_b403_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2717_c2_8f8f_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2723_c7_b403_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2717_c2_8f8f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2717_c2_8f8f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c2_8f8f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2717_c2_8f8f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c2_8f8f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2717_c2_8f8f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c2_8f8f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2717_c2_8f8f] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2717_c2_8f8f_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2717_c2_8f8f_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2717_c2_8f8f_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2717_c2_8f8f_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2717_c2_8f8f_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2717_c2_8f8f_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_6c87_uxn_opcodes_h_l2713_l2770_DUPLICATE_855f LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6c87_uxn_opcodes_h_l2713_l2770_DUPLICATE_855f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_6c87(
     result,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output,
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2717_c2_8f8f_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6c87_uxn_opcodes_h_l2713_l2770_DUPLICATE_855f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6c87_uxn_opcodes_h_l2713_l2770_DUPLICATE_855f_return_output;
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
