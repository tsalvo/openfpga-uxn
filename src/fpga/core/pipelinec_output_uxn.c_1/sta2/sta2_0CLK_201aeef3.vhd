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
-- BIN_OP_EQ[uxn_opcodes_h_l2093_c6_7a03]
signal BIN_OP_EQ_uxn_opcodes_h_l2093_c6_7a03_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2093_c6_7a03_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2093_c6_7a03_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2093_c1_a49e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c1_a49e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c1_a49e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c1_a49e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c1_a49e_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2093_c2_8136]
signal t16_MUX_uxn_opcodes_h_l2093_c2_8136_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2093_c2_8136_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2093_c2_8136_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2093_c2_8136_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2093_c2_8136]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c2_8136_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c2_8136_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c2_8136_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c2_8136_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2093_c2_8136]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c2_8136_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c2_8136_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c2_8136_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c2_8136_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2093_c2_8136]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2093_c2_8136_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2093_c2_8136_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2093_c2_8136_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2093_c2_8136_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2093_c2_8136]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2093_c2_8136_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2093_c2_8136_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2093_c2_8136_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2093_c2_8136_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2093_c2_8136]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c2_8136_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c2_8136_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c2_8136_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c2_8136_return_output : signed(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2093_c2_8136]
signal result_ram_addr_MUX_uxn_opcodes_h_l2093_c2_8136_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2093_c2_8136_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2093_c2_8136_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2093_c2_8136_return_output : unsigned(15 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2093_c2_8136]
signal result_ram_value_MUX_uxn_opcodes_h_l2093_c2_8136_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2093_c2_8136_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2093_c2_8136_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2093_c2_8136_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2093_c2_8136]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2093_c2_8136_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2093_c2_8136_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2093_c2_8136_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2093_c2_8136_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2093_c2_8136]
signal n16_MUX_uxn_opcodes_h_l2093_c2_8136_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2093_c2_8136_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2093_c2_8136_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2093_c2_8136_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2094_c3_cbad[uxn_opcodes_h_l2094_c3_cbad]
signal printf_uxn_opcodes_h_l2094_c3_cbad_uxn_opcodes_h_l2094_c3_cbad_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2099_c11_86e2]
signal BIN_OP_EQ_uxn_opcodes_h_l2099_c11_86e2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2099_c11_86e2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2099_c11_86e2_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2099_c7_c851]
signal t16_MUX_uxn_opcodes_h_l2099_c7_c851_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2099_c7_c851_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2099_c7_c851_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2099_c7_c851_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2099_c7_c851]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2099_c7_c851_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2099_c7_c851_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2099_c7_c851_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2099_c7_c851_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2099_c7_c851]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2099_c7_c851_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2099_c7_c851_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2099_c7_c851_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2099_c7_c851_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2099_c7_c851]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2099_c7_c851_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2099_c7_c851_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2099_c7_c851_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2099_c7_c851_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2099_c7_c851]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2099_c7_c851_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2099_c7_c851_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2099_c7_c851_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2099_c7_c851_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2099_c7_c851]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2099_c7_c851_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2099_c7_c851_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2099_c7_c851_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2099_c7_c851_return_output : signed(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2099_c7_c851]
signal result_ram_addr_MUX_uxn_opcodes_h_l2099_c7_c851_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2099_c7_c851_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2099_c7_c851_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2099_c7_c851_return_output : unsigned(15 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2099_c7_c851]
signal result_ram_value_MUX_uxn_opcodes_h_l2099_c7_c851_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2099_c7_c851_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2099_c7_c851_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2099_c7_c851_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2099_c7_c851]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2099_c7_c851_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2099_c7_c851_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2099_c7_c851_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2099_c7_c851_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2099_c7_c851]
signal n16_MUX_uxn_opcodes_h_l2099_c7_c851_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2099_c7_c851_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2099_c7_c851_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2099_c7_c851_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2102_c11_9526]
signal BIN_OP_EQ_uxn_opcodes_h_l2102_c11_9526_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2102_c11_9526_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2102_c11_9526_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2102_c7_9565]
signal t16_MUX_uxn_opcodes_h_l2102_c7_9565_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2102_c7_9565_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2102_c7_9565_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2102_c7_9565_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2102_c7_9565]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2102_c7_9565_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2102_c7_9565_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2102_c7_9565_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2102_c7_9565_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2102_c7_9565]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2102_c7_9565_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2102_c7_9565_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2102_c7_9565_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2102_c7_9565_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2102_c7_9565]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2102_c7_9565_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2102_c7_9565_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2102_c7_9565_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2102_c7_9565_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2102_c7_9565]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2102_c7_9565_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2102_c7_9565_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2102_c7_9565_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2102_c7_9565_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2102_c7_9565]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2102_c7_9565_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2102_c7_9565_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2102_c7_9565_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2102_c7_9565_return_output : signed(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2102_c7_9565]
signal result_ram_addr_MUX_uxn_opcodes_h_l2102_c7_9565_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2102_c7_9565_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2102_c7_9565_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2102_c7_9565_return_output : unsigned(15 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2102_c7_9565]
signal result_ram_value_MUX_uxn_opcodes_h_l2102_c7_9565_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2102_c7_9565_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2102_c7_9565_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2102_c7_9565_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2102_c7_9565]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2102_c7_9565_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2102_c7_9565_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2102_c7_9565_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2102_c7_9565_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2102_c7_9565]
signal n16_MUX_uxn_opcodes_h_l2102_c7_9565_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2102_c7_9565_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2102_c7_9565_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2102_c7_9565_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2107_c11_5e53]
signal BIN_OP_EQ_uxn_opcodes_h_l2107_c11_5e53_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2107_c11_5e53_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2107_c11_5e53_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2107_c7_2c0e]
signal t16_MUX_uxn_opcodes_h_l2107_c7_2c0e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2107_c7_2c0e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2107_c7_2c0e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2107_c7_2c0e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2107_c7_2c0e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2107_c7_2c0e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2107_c7_2c0e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2107_c7_2c0e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_2c0e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_2c0e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_2c0e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2107_c7_2c0e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2107_c7_2c0e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2107_c7_2c0e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2107_c7_2c0e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2107_c7_2c0e]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2107_c7_2c0e_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2107_c7_2c0e_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2107_c7_2c0e_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2107_c7_2c0e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_2c0e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_2c0e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_2c0e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output : signed(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2107_c7_2c0e]
signal result_ram_addr_MUX_uxn_opcodes_h_l2107_c7_2c0e_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2107_c7_2c0e_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2107_c7_2c0e_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output : unsigned(15 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2107_c7_2c0e]
signal result_ram_value_MUX_uxn_opcodes_h_l2107_c7_2c0e_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2107_c7_2c0e_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2107_c7_2c0e_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2107_c7_2c0e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_2c0e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_2c0e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_2c0e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2107_c7_2c0e]
signal n16_MUX_uxn_opcodes_h_l2107_c7_2c0e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2107_c7_2c0e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2107_c7_2c0e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2110_c11_568b]
signal BIN_OP_EQ_uxn_opcodes_h_l2110_c11_568b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2110_c11_568b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2110_c11_568b_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2110_c7_a2a8]
signal t16_MUX_uxn_opcodes_h_l2110_c7_a2a8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2110_c7_a2a8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2110_c7_a2a8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2110_c7_a2a8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2110_c7_a2a8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2110_c7_a2a8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2110_c7_a2a8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2110_c7_a2a8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2110_c7_a2a8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2110_c7_a2a8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2110_c7_a2a8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2110_c7_a2a8]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2110_c7_a2a8_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2110_c7_a2a8_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2110_c7_a2a8_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2110_c7_a2a8]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2110_c7_a2a8_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2110_c7_a2a8_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2110_c7_a2a8_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2110_c7_a2a8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2110_c7_a2a8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2110_c7_a2a8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2110_c7_a2a8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output : signed(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2110_c7_a2a8]
signal result_ram_addr_MUX_uxn_opcodes_h_l2110_c7_a2a8_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2110_c7_a2a8_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2110_c7_a2a8_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output : unsigned(15 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2110_c7_a2a8]
signal result_ram_value_MUX_uxn_opcodes_h_l2110_c7_a2a8_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2110_c7_a2a8_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2110_c7_a2a8_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2110_c7_a2a8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2110_c7_a2a8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2110_c7_a2a8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2110_c7_a2a8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2110_c7_a2a8]
signal n16_MUX_uxn_opcodes_h_l2110_c7_a2a8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2110_c7_a2a8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2110_c7_a2a8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2111_c3_5270]
signal BIN_OP_OR_uxn_opcodes_h_l2111_c3_5270_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2111_c3_5270_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2111_c3_5270_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2114_c11_3f41]
signal BIN_OP_EQ_uxn_opcodes_h_l2114_c11_3f41_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2114_c11_3f41_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2114_c11_3f41_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2114_c7_d772]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2114_c7_d772_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2114_c7_d772_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2114_c7_d772_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2114_c7_d772_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2114_c7_d772]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2114_c7_d772_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2114_c7_d772_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2114_c7_d772_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2114_c7_d772_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2114_c7_d772]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2114_c7_d772_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2114_c7_d772_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2114_c7_d772_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2114_c7_d772_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2114_c7_d772]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2114_c7_d772_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2114_c7_d772_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2114_c7_d772_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2114_c7_d772_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2114_c7_d772]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2114_c7_d772_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2114_c7_d772_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2114_c7_d772_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2114_c7_d772_return_output : signed(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2114_c7_d772]
signal result_ram_addr_MUX_uxn_opcodes_h_l2114_c7_d772_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2114_c7_d772_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2114_c7_d772_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2114_c7_d772_return_output : unsigned(15 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2114_c7_d772]
signal result_ram_value_MUX_uxn_opcodes_h_l2114_c7_d772_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2114_c7_d772_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2114_c7_d772_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2114_c7_d772_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2114_c7_d772]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2114_c7_d772_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2114_c7_d772_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2114_c7_d772_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2114_c7_d772_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2114_c7_d772]
signal n16_MUX_uxn_opcodes_h_l2114_c7_d772_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2114_c7_d772_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2114_c7_d772_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2114_c7_d772_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2117_c11_0ea0]
signal BIN_OP_EQ_uxn_opcodes_h_l2117_c11_0ea0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2117_c11_0ea0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2117_c11_0ea0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2117_c7_3275]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2117_c7_3275_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2117_c7_3275_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2117_c7_3275_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2117_c7_3275_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2117_c7_3275]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2117_c7_3275_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2117_c7_3275_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2117_c7_3275_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2117_c7_3275_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2117_c7_3275]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2117_c7_3275_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2117_c7_3275_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2117_c7_3275_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2117_c7_3275_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2117_c7_3275]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2117_c7_3275_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2117_c7_3275_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2117_c7_3275_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2117_c7_3275_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2117_c7_3275]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2117_c7_3275_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2117_c7_3275_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2117_c7_3275_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2117_c7_3275_return_output : signed(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2117_c7_3275]
signal result_ram_addr_MUX_uxn_opcodes_h_l2117_c7_3275_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2117_c7_3275_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2117_c7_3275_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2117_c7_3275_return_output : unsigned(15 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2117_c7_3275]
signal result_ram_value_MUX_uxn_opcodes_h_l2117_c7_3275_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2117_c7_3275_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2117_c7_3275_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2117_c7_3275_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2117_c7_3275]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2117_c7_3275_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2117_c7_3275_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2117_c7_3275_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2117_c7_3275_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2117_c7_3275]
signal n16_MUX_uxn_opcodes_h_l2117_c7_3275_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2117_c7_3275_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2117_c7_3275_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2117_c7_3275_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2122_c11_ca38]
signal BIN_OP_EQ_uxn_opcodes_h_l2122_c11_ca38_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2122_c11_ca38_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2122_c11_ca38_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2122_c7_4d21]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2122_c7_4d21_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2122_c7_4d21_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2122_c7_4d21_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2122_c7_4d21]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2122_c7_4d21_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2122_c7_4d21_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2122_c7_4d21_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2122_c7_4d21]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2122_c7_4d21_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2122_c7_4d21_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2122_c7_4d21_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2122_c7_4d21]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2122_c7_4d21_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2122_c7_4d21_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2122_c7_4d21_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2122_c7_4d21]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2122_c7_4d21_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2122_c7_4d21_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2122_c7_4d21_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output : signed(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2122_c7_4d21]
signal result_ram_addr_MUX_uxn_opcodes_h_l2122_c7_4d21_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2122_c7_4d21_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2122_c7_4d21_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output : unsigned(15 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2122_c7_4d21]
signal result_ram_value_MUX_uxn_opcodes_h_l2122_c7_4d21_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2122_c7_4d21_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2122_c7_4d21_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2122_c7_4d21]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2122_c7_4d21_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2122_c7_4d21_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2122_c7_4d21_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2122_c7_4d21]
signal n16_MUX_uxn_opcodes_h_l2122_c7_4d21_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2122_c7_4d21_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2122_c7_4d21_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2125_c11_77c3]
signal BIN_OP_EQ_uxn_opcodes_h_l2125_c11_77c3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2125_c11_77c3_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2125_c11_77c3_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2125_c7_18a0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2125_c7_18a0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2125_c7_18a0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2125_c7_18a0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2125_c7_18a0_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2125_c7_18a0]
signal result_ram_value_MUX_uxn_opcodes_h_l2125_c7_18a0_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2125_c7_18a0_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2125_c7_18a0_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2125_c7_18a0_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2125_c7_18a0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2125_c7_18a0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2125_c7_18a0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2125_c7_18a0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2125_c7_18a0_return_output : signed(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2125_c7_18a0]
signal result_ram_addr_MUX_uxn_opcodes_h_l2125_c7_18a0_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2125_c7_18a0_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2125_c7_18a0_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2125_c7_18a0_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2125_c7_18a0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2125_c7_18a0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2125_c7_18a0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2125_c7_18a0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2125_c7_18a0_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2125_c7_18a0]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2125_c7_18a0_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2125_c7_18a0_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2125_c7_18a0_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2125_c7_18a0_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2125_c7_18a0]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2125_c7_18a0_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2125_c7_18a0_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2125_c7_18a0_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2125_c7_18a0_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2125_c7_18a0]
signal n16_MUX_uxn_opcodes_h_l2125_c7_18a0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2125_c7_18a0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2125_c7_18a0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2125_c7_18a0_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2126_c3_4bc0]
signal BIN_OP_OR_uxn_opcodes_h_l2126_c3_4bc0_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2126_c3_4bc0_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2126_c3_4bc0_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2129_c32_0415]
signal BIN_OP_AND_uxn_opcodes_h_l2129_c32_0415_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2129_c32_0415_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2129_c32_0415_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2129_c32_4840]
signal BIN_OP_GT_uxn_opcodes_h_l2129_c32_4840_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2129_c32_4840_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2129_c32_4840_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2129_c32_c0ed]
signal MUX_uxn_opcodes_h_l2129_c32_c0ed_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2129_c32_c0ed_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2129_c32_c0ed_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2129_c32_c0ed_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2131_c11_81f6]
signal BIN_OP_EQ_uxn_opcodes_h_l2131_c11_81f6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2131_c11_81f6_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2131_c11_81f6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2131_c7_12ab]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2131_c7_12ab_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2131_c7_12ab_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2131_c7_12ab_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2131_c7_12ab_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2131_c7_12ab]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2131_c7_12ab_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2131_c7_12ab_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2131_c7_12ab_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2131_c7_12ab_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2131_c7_12ab]
signal result_ram_addr_MUX_uxn_opcodes_h_l2131_c7_12ab_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2131_c7_12ab_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2131_c7_12ab_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2131_c7_12ab_return_output : unsigned(15 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2131_c7_12ab]
signal result_ram_value_MUX_uxn_opcodes_h_l2131_c7_12ab_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2131_c7_12ab_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2131_c7_12ab_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2131_c7_12ab_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2131_c7_12ab]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2131_c7_12ab_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2131_c7_12ab_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2131_c7_12ab_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2131_c7_12ab_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2135_c32_c980]
signal CONST_SR_8_uxn_opcodes_h_l2135_c32_c980_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2135_c32_c980_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2137_c11_74fd]
signal BIN_OP_EQ_uxn_opcodes_h_l2137_c11_74fd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2137_c11_74fd_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2137_c11_74fd_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2137_c7_c111]
signal result_ram_value_MUX_uxn_opcodes_h_l2137_c7_c111_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2137_c7_c111_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2137_c7_c111_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2137_c7_c111_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2137_c7_c111]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2137_c7_c111_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2137_c7_c111_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2137_c7_c111_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2137_c7_c111_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2137_c7_c111]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_c111_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_c111_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_c111_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_c111_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2137_c7_c111]
signal result_ram_addr_MUX_uxn_opcodes_h_l2137_c7_c111_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2137_c7_c111_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2137_c7_c111_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2137_c7_c111_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2139_c21_c64b]
signal BIN_OP_PLUS_uxn_opcodes_h_l2139_c21_c64b_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2139_c21_c64b_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2139_c21_c64b_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2142_c11_94ae]
signal BIN_OP_EQ_uxn_opcodes_h_l2142_c11_94ae_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2142_c11_94ae_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2142_c11_94ae_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2142_c7_e667]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_e667_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_e667_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_e667_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_e667_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2142_c7_e667]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2142_c7_e667_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2142_c7_e667_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2142_c7_e667_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2142_c7_e667_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2104_l2119_DUPLICATE_9032
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2104_l2119_DUPLICATE_9032_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2104_l2119_DUPLICATE_9032_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_a413( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_stack_read := ref_toks_3;
      base.is_ram_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.ram_addr := ref_toks_6;
      base.ram_value := ref_toks_7;
      base.is_opc_done := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2093_c6_7a03
BIN_OP_EQ_uxn_opcodes_h_l2093_c6_7a03 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2093_c6_7a03_left,
BIN_OP_EQ_uxn_opcodes_h_l2093_c6_7a03_right,
BIN_OP_EQ_uxn_opcodes_h_l2093_c6_7a03_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c1_a49e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c1_a49e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c1_a49e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c1_a49e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c1_a49e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c1_a49e_return_output);

-- t16_MUX_uxn_opcodes_h_l2093_c2_8136
t16_MUX_uxn_opcodes_h_l2093_c2_8136 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2093_c2_8136_cond,
t16_MUX_uxn_opcodes_h_l2093_c2_8136_iftrue,
t16_MUX_uxn_opcodes_h_l2093_c2_8136_iffalse,
t16_MUX_uxn_opcodes_h_l2093_c2_8136_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c2_8136
result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c2_8136 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c2_8136_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c2_8136_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c2_8136_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c2_8136_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c2_8136
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c2_8136 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c2_8136_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c2_8136_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c2_8136_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c2_8136_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2093_c2_8136
result_is_stack_read_MUX_uxn_opcodes_h_l2093_c2_8136 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2093_c2_8136_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2093_c2_8136_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2093_c2_8136_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2093_c2_8136_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2093_c2_8136
result_is_ram_write_MUX_uxn_opcodes_h_l2093_c2_8136 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2093_c2_8136_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2093_c2_8136_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2093_c2_8136_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2093_c2_8136_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c2_8136
result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c2_8136 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c2_8136_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c2_8136_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c2_8136_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c2_8136_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2093_c2_8136
result_ram_addr_MUX_uxn_opcodes_h_l2093_c2_8136 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2093_c2_8136_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2093_c2_8136_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2093_c2_8136_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2093_c2_8136_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2093_c2_8136
result_ram_value_MUX_uxn_opcodes_h_l2093_c2_8136 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2093_c2_8136_cond,
result_ram_value_MUX_uxn_opcodes_h_l2093_c2_8136_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2093_c2_8136_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2093_c2_8136_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2093_c2_8136
result_is_opc_done_MUX_uxn_opcodes_h_l2093_c2_8136 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2093_c2_8136_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2093_c2_8136_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2093_c2_8136_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2093_c2_8136_return_output);

-- n16_MUX_uxn_opcodes_h_l2093_c2_8136
n16_MUX_uxn_opcodes_h_l2093_c2_8136 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2093_c2_8136_cond,
n16_MUX_uxn_opcodes_h_l2093_c2_8136_iftrue,
n16_MUX_uxn_opcodes_h_l2093_c2_8136_iffalse,
n16_MUX_uxn_opcodes_h_l2093_c2_8136_return_output);

-- printf_uxn_opcodes_h_l2094_c3_cbad_uxn_opcodes_h_l2094_c3_cbad
printf_uxn_opcodes_h_l2094_c3_cbad_uxn_opcodes_h_l2094_c3_cbad : entity work.printf_uxn_opcodes_h_l2094_c3_cbad_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2094_c3_cbad_uxn_opcodes_h_l2094_c3_cbad_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2099_c11_86e2
BIN_OP_EQ_uxn_opcodes_h_l2099_c11_86e2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2099_c11_86e2_left,
BIN_OP_EQ_uxn_opcodes_h_l2099_c11_86e2_right,
BIN_OP_EQ_uxn_opcodes_h_l2099_c11_86e2_return_output);

-- t16_MUX_uxn_opcodes_h_l2099_c7_c851
t16_MUX_uxn_opcodes_h_l2099_c7_c851 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2099_c7_c851_cond,
t16_MUX_uxn_opcodes_h_l2099_c7_c851_iftrue,
t16_MUX_uxn_opcodes_h_l2099_c7_c851_iffalse,
t16_MUX_uxn_opcodes_h_l2099_c7_c851_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2099_c7_c851
result_is_sp_shift_MUX_uxn_opcodes_h_l2099_c7_c851 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2099_c7_c851_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2099_c7_c851_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2099_c7_c851_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2099_c7_c851_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2099_c7_c851
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2099_c7_c851 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2099_c7_c851_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2099_c7_c851_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2099_c7_c851_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2099_c7_c851_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2099_c7_c851
result_is_stack_read_MUX_uxn_opcodes_h_l2099_c7_c851 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2099_c7_c851_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2099_c7_c851_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2099_c7_c851_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2099_c7_c851_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2099_c7_c851
result_is_ram_write_MUX_uxn_opcodes_h_l2099_c7_c851 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2099_c7_c851_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2099_c7_c851_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2099_c7_c851_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2099_c7_c851_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2099_c7_c851
result_sp_relative_shift_MUX_uxn_opcodes_h_l2099_c7_c851 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2099_c7_c851_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2099_c7_c851_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2099_c7_c851_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2099_c7_c851_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2099_c7_c851
result_ram_addr_MUX_uxn_opcodes_h_l2099_c7_c851 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2099_c7_c851_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2099_c7_c851_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2099_c7_c851_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2099_c7_c851_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2099_c7_c851
result_ram_value_MUX_uxn_opcodes_h_l2099_c7_c851 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2099_c7_c851_cond,
result_ram_value_MUX_uxn_opcodes_h_l2099_c7_c851_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2099_c7_c851_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2099_c7_c851_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2099_c7_c851
result_is_opc_done_MUX_uxn_opcodes_h_l2099_c7_c851 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2099_c7_c851_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2099_c7_c851_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2099_c7_c851_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2099_c7_c851_return_output);

-- n16_MUX_uxn_opcodes_h_l2099_c7_c851
n16_MUX_uxn_opcodes_h_l2099_c7_c851 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2099_c7_c851_cond,
n16_MUX_uxn_opcodes_h_l2099_c7_c851_iftrue,
n16_MUX_uxn_opcodes_h_l2099_c7_c851_iffalse,
n16_MUX_uxn_opcodes_h_l2099_c7_c851_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2102_c11_9526
BIN_OP_EQ_uxn_opcodes_h_l2102_c11_9526 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2102_c11_9526_left,
BIN_OP_EQ_uxn_opcodes_h_l2102_c11_9526_right,
BIN_OP_EQ_uxn_opcodes_h_l2102_c11_9526_return_output);

-- t16_MUX_uxn_opcodes_h_l2102_c7_9565
t16_MUX_uxn_opcodes_h_l2102_c7_9565 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2102_c7_9565_cond,
t16_MUX_uxn_opcodes_h_l2102_c7_9565_iftrue,
t16_MUX_uxn_opcodes_h_l2102_c7_9565_iffalse,
t16_MUX_uxn_opcodes_h_l2102_c7_9565_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2102_c7_9565
result_is_sp_shift_MUX_uxn_opcodes_h_l2102_c7_9565 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2102_c7_9565_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2102_c7_9565_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2102_c7_9565_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2102_c7_9565_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2102_c7_9565
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2102_c7_9565 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2102_c7_9565_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2102_c7_9565_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2102_c7_9565_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2102_c7_9565_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2102_c7_9565
result_is_stack_read_MUX_uxn_opcodes_h_l2102_c7_9565 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2102_c7_9565_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2102_c7_9565_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2102_c7_9565_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2102_c7_9565_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2102_c7_9565
result_is_ram_write_MUX_uxn_opcodes_h_l2102_c7_9565 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2102_c7_9565_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2102_c7_9565_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2102_c7_9565_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2102_c7_9565_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2102_c7_9565
result_sp_relative_shift_MUX_uxn_opcodes_h_l2102_c7_9565 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2102_c7_9565_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2102_c7_9565_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2102_c7_9565_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2102_c7_9565_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2102_c7_9565
result_ram_addr_MUX_uxn_opcodes_h_l2102_c7_9565 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2102_c7_9565_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2102_c7_9565_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2102_c7_9565_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2102_c7_9565_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2102_c7_9565
result_ram_value_MUX_uxn_opcodes_h_l2102_c7_9565 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2102_c7_9565_cond,
result_ram_value_MUX_uxn_opcodes_h_l2102_c7_9565_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2102_c7_9565_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2102_c7_9565_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2102_c7_9565
result_is_opc_done_MUX_uxn_opcodes_h_l2102_c7_9565 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2102_c7_9565_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2102_c7_9565_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2102_c7_9565_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2102_c7_9565_return_output);

-- n16_MUX_uxn_opcodes_h_l2102_c7_9565
n16_MUX_uxn_opcodes_h_l2102_c7_9565 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2102_c7_9565_cond,
n16_MUX_uxn_opcodes_h_l2102_c7_9565_iftrue,
n16_MUX_uxn_opcodes_h_l2102_c7_9565_iffalse,
n16_MUX_uxn_opcodes_h_l2102_c7_9565_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2107_c11_5e53
BIN_OP_EQ_uxn_opcodes_h_l2107_c11_5e53 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2107_c11_5e53_left,
BIN_OP_EQ_uxn_opcodes_h_l2107_c11_5e53_right,
BIN_OP_EQ_uxn_opcodes_h_l2107_c11_5e53_return_output);

-- t16_MUX_uxn_opcodes_h_l2107_c7_2c0e
t16_MUX_uxn_opcodes_h_l2107_c7_2c0e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2107_c7_2c0e_cond,
t16_MUX_uxn_opcodes_h_l2107_c7_2c0e_iftrue,
t16_MUX_uxn_opcodes_h_l2107_c7_2c0e_iffalse,
t16_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2107_c7_2c0e
result_is_sp_shift_MUX_uxn_opcodes_h_l2107_c7_2c0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2107_c7_2c0e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2107_c7_2c0e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2107_c7_2c0e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_2c0e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_2c0e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_2c0e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_2c0e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_2c0e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2107_c7_2c0e
result_is_stack_read_MUX_uxn_opcodes_h_l2107_c7_2c0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2107_c7_2c0e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2107_c7_2c0e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2107_c7_2c0e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2107_c7_2c0e
result_is_ram_write_MUX_uxn_opcodes_h_l2107_c7_2c0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2107_c7_2c0e_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2107_c7_2c0e_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2107_c7_2c0e_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_2c0e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_2c0e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_2c0e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_2c0e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_2c0e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2107_c7_2c0e
result_ram_addr_MUX_uxn_opcodes_h_l2107_c7_2c0e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2107_c7_2c0e_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2107_c7_2c0e_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2107_c7_2c0e_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2107_c7_2c0e
result_ram_value_MUX_uxn_opcodes_h_l2107_c7_2c0e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2107_c7_2c0e_cond,
result_ram_value_MUX_uxn_opcodes_h_l2107_c7_2c0e_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2107_c7_2c0e_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_2c0e
result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_2c0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_2c0e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_2c0e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_2c0e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output);

-- n16_MUX_uxn_opcodes_h_l2107_c7_2c0e
n16_MUX_uxn_opcodes_h_l2107_c7_2c0e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2107_c7_2c0e_cond,
n16_MUX_uxn_opcodes_h_l2107_c7_2c0e_iftrue,
n16_MUX_uxn_opcodes_h_l2107_c7_2c0e_iffalse,
n16_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2110_c11_568b
BIN_OP_EQ_uxn_opcodes_h_l2110_c11_568b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2110_c11_568b_left,
BIN_OP_EQ_uxn_opcodes_h_l2110_c11_568b_right,
BIN_OP_EQ_uxn_opcodes_h_l2110_c11_568b_return_output);

-- t16_MUX_uxn_opcodes_h_l2110_c7_a2a8
t16_MUX_uxn_opcodes_h_l2110_c7_a2a8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2110_c7_a2a8_cond,
t16_MUX_uxn_opcodes_h_l2110_c7_a2a8_iftrue,
t16_MUX_uxn_opcodes_h_l2110_c7_a2a8_iffalse,
t16_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2110_c7_a2a8
result_is_sp_shift_MUX_uxn_opcodes_h_l2110_c7_a2a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2110_c7_a2a8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2110_c7_a2a8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2110_c7_a2a8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2110_c7_a2a8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2110_c7_a2a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2110_c7_a2a8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2110_c7_a2a8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2110_c7_a2a8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2110_c7_a2a8
result_is_stack_read_MUX_uxn_opcodes_h_l2110_c7_a2a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2110_c7_a2a8_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2110_c7_a2a8_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2110_c7_a2a8_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2110_c7_a2a8
result_is_ram_write_MUX_uxn_opcodes_h_l2110_c7_a2a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2110_c7_a2a8_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2110_c7_a2a8_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2110_c7_a2a8_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2110_c7_a2a8
result_sp_relative_shift_MUX_uxn_opcodes_h_l2110_c7_a2a8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2110_c7_a2a8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2110_c7_a2a8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2110_c7_a2a8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2110_c7_a2a8
result_ram_addr_MUX_uxn_opcodes_h_l2110_c7_a2a8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2110_c7_a2a8_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2110_c7_a2a8_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2110_c7_a2a8_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2110_c7_a2a8
result_ram_value_MUX_uxn_opcodes_h_l2110_c7_a2a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2110_c7_a2a8_cond,
result_ram_value_MUX_uxn_opcodes_h_l2110_c7_a2a8_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2110_c7_a2a8_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2110_c7_a2a8
result_is_opc_done_MUX_uxn_opcodes_h_l2110_c7_a2a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2110_c7_a2a8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2110_c7_a2a8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2110_c7_a2a8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output);

-- n16_MUX_uxn_opcodes_h_l2110_c7_a2a8
n16_MUX_uxn_opcodes_h_l2110_c7_a2a8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2110_c7_a2a8_cond,
n16_MUX_uxn_opcodes_h_l2110_c7_a2a8_iftrue,
n16_MUX_uxn_opcodes_h_l2110_c7_a2a8_iffalse,
n16_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2111_c3_5270
BIN_OP_OR_uxn_opcodes_h_l2111_c3_5270 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2111_c3_5270_left,
BIN_OP_OR_uxn_opcodes_h_l2111_c3_5270_right,
BIN_OP_OR_uxn_opcodes_h_l2111_c3_5270_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2114_c11_3f41
BIN_OP_EQ_uxn_opcodes_h_l2114_c11_3f41 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2114_c11_3f41_left,
BIN_OP_EQ_uxn_opcodes_h_l2114_c11_3f41_right,
BIN_OP_EQ_uxn_opcodes_h_l2114_c11_3f41_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2114_c7_d772
result_is_sp_shift_MUX_uxn_opcodes_h_l2114_c7_d772 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2114_c7_d772_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2114_c7_d772_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2114_c7_d772_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2114_c7_d772_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2114_c7_d772
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2114_c7_d772 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2114_c7_d772_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2114_c7_d772_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2114_c7_d772_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2114_c7_d772_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2114_c7_d772
result_is_stack_read_MUX_uxn_opcodes_h_l2114_c7_d772 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2114_c7_d772_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2114_c7_d772_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2114_c7_d772_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2114_c7_d772_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2114_c7_d772
result_is_ram_write_MUX_uxn_opcodes_h_l2114_c7_d772 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2114_c7_d772_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2114_c7_d772_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2114_c7_d772_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2114_c7_d772_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2114_c7_d772
result_sp_relative_shift_MUX_uxn_opcodes_h_l2114_c7_d772 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2114_c7_d772_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2114_c7_d772_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2114_c7_d772_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2114_c7_d772_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2114_c7_d772
result_ram_addr_MUX_uxn_opcodes_h_l2114_c7_d772 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2114_c7_d772_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2114_c7_d772_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2114_c7_d772_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2114_c7_d772_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2114_c7_d772
result_ram_value_MUX_uxn_opcodes_h_l2114_c7_d772 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2114_c7_d772_cond,
result_ram_value_MUX_uxn_opcodes_h_l2114_c7_d772_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2114_c7_d772_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2114_c7_d772_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2114_c7_d772
result_is_opc_done_MUX_uxn_opcodes_h_l2114_c7_d772 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2114_c7_d772_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2114_c7_d772_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2114_c7_d772_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2114_c7_d772_return_output);

-- n16_MUX_uxn_opcodes_h_l2114_c7_d772
n16_MUX_uxn_opcodes_h_l2114_c7_d772 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2114_c7_d772_cond,
n16_MUX_uxn_opcodes_h_l2114_c7_d772_iftrue,
n16_MUX_uxn_opcodes_h_l2114_c7_d772_iffalse,
n16_MUX_uxn_opcodes_h_l2114_c7_d772_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2117_c11_0ea0
BIN_OP_EQ_uxn_opcodes_h_l2117_c11_0ea0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2117_c11_0ea0_left,
BIN_OP_EQ_uxn_opcodes_h_l2117_c11_0ea0_right,
BIN_OP_EQ_uxn_opcodes_h_l2117_c11_0ea0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2117_c7_3275
result_is_sp_shift_MUX_uxn_opcodes_h_l2117_c7_3275 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2117_c7_3275_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2117_c7_3275_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2117_c7_3275_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2117_c7_3275_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2117_c7_3275
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2117_c7_3275 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2117_c7_3275_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2117_c7_3275_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2117_c7_3275_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2117_c7_3275_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2117_c7_3275
result_is_stack_read_MUX_uxn_opcodes_h_l2117_c7_3275 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2117_c7_3275_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2117_c7_3275_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2117_c7_3275_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2117_c7_3275_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2117_c7_3275
result_is_ram_write_MUX_uxn_opcodes_h_l2117_c7_3275 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2117_c7_3275_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2117_c7_3275_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2117_c7_3275_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2117_c7_3275_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2117_c7_3275
result_sp_relative_shift_MUX_uxn_opcodes_h_l2117_c7_3275 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2117_c7_3275_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2117_c7_3275_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2117_c7_3275_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2117_c7_3275_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2117_c7_3275
result_ram_addr_MUX_uxn_opcodes_h_l2117_c7_3275 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2117_c7_3275_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2117_c7_3275_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2117_c7_3275_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2117_c7_3275_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2117_c7_3275
result_ram_value_MUX_uxn_opcodes_h_l2117_c7_3275 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2117_c7_3275_cond,
result_ram_value_MUX_uxn_opcodes_h_l2117_c7_3275_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2117_c7_3275_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2117_c7_3275_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2117_c7_3275
result_is_opc_done_MUX_uxn_opcodes_h_l2117_c7_3275 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2117_c7_3275_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2117_c7_3275_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2117_c7_3275_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2117_c7_3275_return_output);

-- n16_MUX_uxn_opcodes_h_l2117_c7_3275
n16_MUX_uxn_opcodes_h_l2117_c7_3275 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2117_c7_3275_cond,
n16_MUX_uxn_opcodes_h_l2117_c7_3275_iftrue,
n16_MUX_uxn_opcodes_h_l2117_c7_3275_iffalse,
n16_MUX_uxn_opcodes_h_l2117_c7_3275_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2122_c11_ca38
BIN_OP_EQ_uxn_opcodes_h_l2122_c11_ca38 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2122_c11_ca38_left,
BIN_OP_EQ_uxn_opcodes_h_l2122_c11_ca38_right,
BIN_OP_EQ_uxn_opcodes_h_l2122_c11_ca38_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2122_c7_4d21
result_is_sp_shift_MUX_uxn_opcodes_h_l2122_c7_4d21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2122_c7_4d21_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2122_c7_4d21_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2122_c7_4d21_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2122_c7_4d21
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2122_c7_4d21 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2122_c7_4d21_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2122_c7_4d21_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2122_c7_4d21_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2122_c7_4d21
result_is_stack_read_MUX_uxn_opcodes_h_l2122_c7_4d21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2122_c7_4d21_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2122_c7_4d21_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2122_c7_4d21_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2122_c7_4d21
result_is_ram_write_MUX_uxn_opcodes_h_l2122_c7_4d21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2122_c7_4d21_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2122_c7_4d21_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2122_c7_4d21_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2122_c7_4d21
result_sp_relative_shift_MUX_uxn_opcodes_h_l2122_c7_4d21 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2122_c7_4d21_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2122_c7_4d21_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2122_c7_4d21_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2122_c7_4d21
result_ram_addr_MUX_uxn_opcodes_h_l2122_c7_4d21 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2122_c7_4d21_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2122_c7_4d21_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2122_c7_4d21_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2122_c7_4d21
result_ram_value_MUX_uxn_opcodes_h_l2122_c7_4d21 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2122_c7_4d21_cond,
result_ram_value_MUX_uxn_opcodes_h_l2122_c7_4d21_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2122_c7_4d21_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2122_c7_4d21
result_is_opc_done_MUX_uxn_opcodes_h_l2122_c7_4d21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2122_c7_4d21_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2122_c7_4d21_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2122_c7_4d21_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output);

-- n16_MUX_uxn_opcodes_h_l2122_c7_4d21
n16_MUX_uxn_opcodes_h_l2122_c7_4d21 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2122_c7_4d21_cond,
n16_MUX_uxn_opcodes_h_l2122_c7_4d21_iftrue,
n16_MUX_uxn_opcodes_h_l2122_c7_4d21_iffalse,
n16_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2125_c11_77c3
BIN_OP_EQ_uxn_opcodes_h_l2125_c11_77c3 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2125_c11_77c3_left,
BIN_OP_EQ_uxn_opcodes_h_l2125_c11_77c3_right,
BIN_OP_EQ_uxn_opcodes_h_l2125_c11_77c3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2125_c7_18a0
result_is_sp_shift_MUX_uxn_opcodes_h_l2125_c7_18a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2125_c7_18a0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2125_c7_18a0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2125_c7_18a0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2125_c7_18a0_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2125_c7_18a0
result_ram_value_MUX_uxn_opcodes_h_l2125_c7_18a0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2125_c7_18a0_cond,
result_ram_value_MUX_uxn_opcodes_h_l2125_c7_18a0_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2125_c7_18a0_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2125_c7_18a0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2125_c7_18a0
result_sp_relative_shift_MUX_uxn_opcodes_h_l2125_c7_18a0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2125_c7_18a0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2125_c7_18a0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2125_c7_18a0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2125_c7_18a0_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2125_c7_18a0
result_ram_addr_MUX_uxn_opcodes_h_l2125_c7_18a0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2125_c7_18a0_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2125_c7_18a0_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2125_c7_18a0_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2125_c7_18a0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2125_c7_18a0
result_is_opc_done_MUX_uxn_opcodes_h_l2125_c7_18a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2125_c7_18a0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2125_c7_18a0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2125_c7_18a0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2125_c7_18a0_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2125_c7_18a0
result_is_stack_read_MUX_uxn_opcodes_h_l2125_c7_18a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2125_c7_18a0_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2125_c7_18a0_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2125_c7_18a0_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2125_c7_18a0_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2125_c7_18a0
result_is_ram_write_MUX_uxn_opcodes_h_l2125_c7_18a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2125_c7_18a0_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2125_c7_18a0_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2125_c7_18a0_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2125_c7_18a0_return_output);

-- n16_MUX_uxn_opcodes_h_l2125_c7_18a0
n16_MUX_uxn_opcodes_h_l2125_c7_18a0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2125_c7_18a0_cond,
n16_MUX_uxn_opcodes_h_l2125_c7_18a0_iftrue,
n16_MUX_uxn_opcodes_h_l2125_c7_18a0_iffalse,
n16_MUX_uxn_opcodes_h_l2125_c7_18a0_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2126_c3_4bc0
BIN_OP_OR_uxn_opcodes_h_l2126_c3_4bc0 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2126_c3_4bc0_left,
BIN_OP_OR_uxn_opcodes_h_l2126_c3_4bc0_right,
BIN_OP_OR_uxn_opcodes_h_l2126_c3_4bc0_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2129_c32_0415
BIN_OP_AND_uxn_opcodes_h_l2129_c32_0415 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2129_c32_0415_left,
BIN_OP_AND_uxn_opcodes_h_l2129_c32_0415_right,
BIN_OP_AND_uxn_opcodes_h_l2129_c32_0415_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2129_c32_4840
BIN_OP_GT_uxn_opcodes_h_l2129_c32_4840 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2129_c32_4840_left,
BIN_OP_GT_uxn_opcodes_h_l2129_c32_4840_right,
BIN_OP_GT_uxn_opcodes_h_l2129_c32_4840_return_output);

-- MUX_uxn_opcodes_h_l2129_c32_c0ed
MUX_uxn_opcodes_h_l2129_c32_c0ed : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2129_c32_c0ed_cond,
MUX_uxn_opcodes_h_l2129_c32_c0ed_iftrue,
MUX_uxn_opcodes_h_l2129_c32_c0ed_iffalse,
MUX_uxn_opcodes_h_l2129_c32_c0ed_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2131_c11_81f6
BIN_OP_EQ_uxn_opcodes_h_l2131_c11_81f6 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2131_c11_81f6_left,
BIN_OP_EQ_uxn_opcodes_h_l2131_c11_81f6_right,
BIN_OP_EQ_uxn_opcodes_h_l2131_c11_81f6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2131_c7_12ab
result_is_sp_shift_MUX_uxn_opcodes_h_l2131_c7_12ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2131_c7_12ab_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2131_c7_12ab_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2131_c7_12ab_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2131_c7_12ab_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2131_c7_12ab
result_is_opc_done_MUX_uxn_opcodes_h_l2131_c7_12ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2131_c7_12ab_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2131_c7_12ab_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2131_c7_12ab_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2131_c7_12ab_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2131_c7_12ab
result_ram_addr_MUX_uxn_opcodes_h_l2131_c7_12ab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2131_c7_12ab_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2131_c7_12ab_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2131_c7_12ab_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2131_c7_12ab_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2131_c7_12ab
result_ram_value_MUX_uxn_opcodes_h_l2131_c7_12ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2131_c7_12ab_cond,
result_ram_value_MUX_uxn_opcodes_h_l2131_c7_12ab_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2131_c7_12ab_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2131_c7_12ab_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2131_c7_12ab
result_is_ram_write_MUX_uxn_opcodes_h_l2131_c7_12ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2131_c7_12ab_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2131_c7_12ab_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2131_c7_12ab_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2131_c7_12ab_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2135_c32_c980
CONST_SR_8_uxn_opcodes_h_l2135_c32_c980 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2135_c32_c980_x,
CONST_SR_8_uxn_opcodes_h_l2135_c32_c980_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2137_c11_74fd
BIN_OP_EQ_uxn_opcodes_h_l2137_c11_74fd : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2137_c11_74fd_left,
BIN_OP_EQ_uxn_opcodes_h_l2137_c11_74fd_right,
BIN_OP_EQ_uxn_opcodes_h_l2137_c11_74fd_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2137_c7_c111
result_ram_value_MUX_uxn_opcodes_h_l2137_c7_c111 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2137_c7_c111_cond,
result_ram_value_MUX_uxn_opcodes_h_l2137_c7_c111_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2137_c7_c111_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2137_c7_c111_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2137_c7_c111
result_is_ram_write_MUX_uxn_opcodes_h_l2137_c7_c111 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2137_c7_c111_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2137_c7_c111_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2137_c7_c111_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2137_c7_c111_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_c111
result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_c111 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_c111_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_c111_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_c111_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_c111_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2137_c7_c111
result_ram_addr_MUX_uxn_opcodes_h_l2137_c7_c111 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2137_c7_c111_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2137_c7_c111_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2137_c7_c111_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2137_c7_c111_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2139_c21_c64b
BIN_OP_PLUS_uxn_opcodes_h_l2139_c21_c64b : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2139_c21_c64b_left,
BIN_OP_PLUS_uxn_opcodes_h_l2139_c21_c64b_right,
BIN_OP_PLUS_uxn_opcodes_h_l2139_c21_c64b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2142_c11_94ae
BIN_OP_EQ_uxn_opcodes_h_l2142_c11_94ae : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2142_c11_94ae_left,
BIN_OP_EQ_uxn_opcodes_h_l2142_c11_94ae_right,
BIN_OP_EQ_uxn_opcodes_h_l2142_c11_94ae_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_e667
result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_e667 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_e667_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_e667_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_e667_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_e667_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2142_c7_e667
result_is_ram_write_MUX_uxn_opcodes_h_l2142_c7_e667 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2142_c7_e667_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2142_c7_e667_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2142_c7_e667_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2142_c7_e667_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2104_l2119_DUPLICATE_9032
CONST_SL_8_uint16_t_uxn_opcodes_h_l2104_l2119_DUPLICATE_9032 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2104_l2119_DUPLICATE_9032_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2104_l2119_DUPLICATE_9032_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2093_c6_7a03_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c1_a49e_return_output,
 t16_MUX_uxn_opcodes_h_l2093_c2_8136_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c2_8136_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c2_8136_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2093_c2_8136_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2093_c2_8136_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c2_8136_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2093_c2_8136_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2093_c2_8136_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2093_c2_8136_return_output,
 n16_MUX_uxn_opcodes_h_l2093_c2_8136_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2099_c11_86e2_return_output,
 t16_MUX_uxn_opcodes_h_l2099_c7_c851_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2099_c7_c851_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2099_c7_c851_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2099_c7_c851_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2099_c7_c851_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2099_c7_c851_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2099_c7_c851_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2099_c7_c851_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2099_c7_c851_return_output,
 n16_MUX_uxn_opcodes_h_l2099_c7_c851_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2102_c11_9526_return_output,
 t16_MUX_uxn_opcodes_h_l2102_c7_9565_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2102_c7_9565_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2102_c7_9565_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2102_c7_9565_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2102_c7_9565_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2102_c7_9565_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2102_c7_9565_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2102_c7_9565_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2102_c7_9565_return_output,
 n16_MUX_uxn_opcodes_h_l2102_c7_9565_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2107_c11_5e53_return_output,
 t16_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output,
 n16_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2110_c11_568b_return_output,
 t16_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output,
 n16_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2111_c3_5270_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2114_c11_3f41_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2114_c7_d772_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2114_c7_d772_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2114_c7_d772_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2114_c7_d772_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2114_c7_d772_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2114_c7_d772_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2114_c7_d772_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2114_c7_d772_return_output,
 n16_MUX_uxn_opcodes_h_l2114_c7_d772_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2117_c11_0ea0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2117_c7_3275_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2117_c7_3275_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2117_c7_3275_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2117_c7_3275_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2117_c7_3275_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2117_c7_3275_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2117_c7_3275_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2117_c7_3275_return_output,
 n16_MUX_uxn_opcodes_h_l2117_c7_3275_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2122_c11_ca38_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output,
 n16_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2125_c11_77c3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2125_c7_18a0_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2125_c7_18a0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2125_c7_18a0_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2125_c7_18a0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2125_c7_18a0_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2125_c7_18a0_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2125_c7_18a0_return_output,
 n16_MUX_uxn_opcodes_h_l2125_c7_18a0_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2126_c3_4bc0_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2129_c32_0415_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2129_c32_4840_return_output,
 MUX_uxn_opcodes_h_l2129_c32_c0ed_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2131_c11_81f6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2131_c7_12ab_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2131_c7_12ab_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2131_c7_12ab_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2131_c7_12ab_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2131_c7_12ab_return_output,
 CONST_SR_8_uxn_opcodes_h_l2135_c32_c980_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2137_c11_74fd_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2137_c7_c111_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2137_c7_c111_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_c111_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2137_c7_c111_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2139_c21_c64b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2142_c11_94ae_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_e667_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2142_c7_e667_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2104_l2119_DUPLICATE_9032_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2093_c6_7a03_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2093_c6_7a03_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2093_c6_7a03_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c1_a49e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c1_a49e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c1_a49e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c1_a49e_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2093_c2_8136_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2093_c2_8136_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2099_c7_c851_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2093_c2_8136_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2093_c2_8136_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c2_8136_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c2_8136_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2099_c7_c851_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c2_8136_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c2_8136_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c2_8136_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2096_c3_d1fd : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c2_8136_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2099_c7_c851_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c2_8136_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c2_8136_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2093_c2_8136_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2093_c2_8136_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2099_c7_c851_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2093_c2_8136_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2093_c2_8136_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2093_c2_8136_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2093_c2_8136_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2099_c7_c851_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2093_c2_8136_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2093_c2_8136_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c2_8136_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c2_8136_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2099_c7_c851_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c2_8136_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c2_8136_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2093_c2_8136_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2093_c2_8136_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2099_c7_c851_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2093_c2_8136_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2093_c2_8136_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2093_c2_8136_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2093_c2_8136_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2099_c7_c851_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2093_c2_8136_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2093_c2_8136_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2093_c2_8136_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2093_c2_8136_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2099_c7_c851_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2093_c2_8136_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2093_c2_8136_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2093_c2_8136_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2093_c2_8136_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2099_c7_c851_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2093_c2_8136_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2093_c2_8136_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2094_c3_cbad_uxn_opcodes_h_l2094_c3_cbad_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2099_c11_86e2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2099_c11_86e2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2099_c11_86e2_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2099_c7_c851_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2099_c7_c851_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2102_c7_9565_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2099_c7_c851_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2099_c7_c851_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2099_c7_c851_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2102_c7_9565_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2099_c7_c851_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2099_c7_c851_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2100_c3_cf12 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2099_c7_c851_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2102_c7_9565_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2099_c7_c851_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2099_c7_c851_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2099_c7_c851_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2102_c7_9565_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2099_c7_c851_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2099_c7_c851_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2099_c7_c851_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2102_c7_9565_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2099_c7_c851_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2099_c7_c851_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2099_c7_c851_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2102_c7_9565_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2099_c7_c851_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2099_c7_c851_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2099_c7_c851_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2102_c7_9565_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2099_c7_c851_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2099_c7_c851_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2099_c7_c851_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2102_c7_9565_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2099_c7_c851_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2099_c7_c851_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2099_c7_c851_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2102_c7_9565_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2099_c7_c851_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2099_c7_c851_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2099_c7_c851_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2102_c7_9565_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2099_c7_c851_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2102_c11_9526_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2102_c11_9526_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2102_c11_9526_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2102_c7_9565_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2102_c7_9565_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2102_c7_9565_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2102_c7_9565_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2102_c7_9565_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2102_c7_9565_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2102_c7_9565_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2105_c3_9aaf : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2102_c7_9565_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2102_c7_9565_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2102_c7_9565_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2102_c7_9565_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2102_c7_9565_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2102_c7_9565_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2102_c7_9565_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2102_c7_9565_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2102_c7_9565_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2102_c7_9565_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2102_c7_9565_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2102_c7_9565_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2102_c7_9565_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2102_c7_9565_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2102_c7_9565_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2102_c7_9565_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2102_c7_9565_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2102_c7_9565_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2102_c7_9565_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2102_c7_9565_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2102_c7_9565_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2102_c7_9565_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2102_c7_9565_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_5e53_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_5e53_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_5e53_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2107_c7_2c0e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2107_c7_2c0e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2107_c7_2c0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2107_c7_2c0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2107_c7_2c0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2107_c7_2c0e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_2c0e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2108_c3_4308 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_2c0e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_2c0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2107_c7_2c0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2107_c7_2c0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2107_c7_2c0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2107_c7_2c0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2107_c7_2c0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2107_c7_2c0e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_2c0e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_2c0e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_2c0e_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2107_c7_2c0e_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2107_c7_2c0e_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2107_c7_2c0e_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2107_c7_2c0e_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2107_c7_2c0e_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2107_c7_2c0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_2c0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_2c0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_2c0e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2107_c7_2c0e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2107_c7_2c0e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2107_c7_2c0e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2110_c11_568b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2110_c11_568b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2110_c11_568b_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2110_c7_a2a8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2110_c7_a2a8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2110_c7_a2a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2110_c7_a2a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2110_c7_a2a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2114_c7_d772_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2110_c7_a2a8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2110_c7_a2a8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2112_c3_9d3b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2110_c7_a2a8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2114_c7_d772_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2110_c7_a2a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2110_c7_a2a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2110_c7_a2a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2114_c7_d772_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2110_c7_a2a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2110_c7_a2a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2110_c7_a2a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2114_c7_d772_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2110_c7_a2a8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2110_c7_a2a8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2110_c7_a2a8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2114_c7_d772_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2110_c7_a2a8_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2110_c7_a2a8_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2110_c7_a2a8_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2114_c7_d772_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2110_c7_a2a8_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2110_c7_a2a8_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2110_c7_a2a8_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2114_c7_d772_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2110_c7_a2a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2110_c7_a2a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2110_c7_a2a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2114_c7_d772_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2110_c7_a2a8_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2110_c7_a2a8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2110_c7_a2a8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2114_c7_d772_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2110_c7_a2a8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2111_c3_5270_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2111_c3_5270_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2111_c3_5270_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2114_c11_3f41_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2114_c11_3f41_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2114_c11_3f41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2114_c7_d772_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2114_c7_d772_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2117_c7_3275_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2114_c7_d772_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2114_c7_d772_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2115_c3_dfe0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2114_c7_d772_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2117_c7_3275_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2114_c7_d772_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2114_c7_d772_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2114_c7_d772_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2117_c7_3275_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2114_c7_d772_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2114_c7_d772_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2114_c7_d772_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2117_c7_3275_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2114_c7_d772_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2114_c7_d772_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2114_c7_d772_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2117_c7_3275_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2114_c7_d772_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2114_c7_d772_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2114_c7_d772_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2117_c7_3275_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2114_c7_d772_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2114_c7_d772_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2114_c7_d772_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2117_c7_3275_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2114_c7_d772_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2114_c7_d772_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2114_c7_d772_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2117_c7_3275_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2114_c7_d772_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2114_c7_d772_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2114_c7_d772_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2117_c7_3275_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2114_c7_d772_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2117_c11_0ea0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2117_c11_0ea0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2117_c11_0ea0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2117_c7_3275_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2117_c7_3275_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2117_c7_3275_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2117_c7_3275_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2120_c3_115a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2117_c7_3275_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2117_c7_3275_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2117_c7_3275_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2117_c7_3275_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2117_c7_3275_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2117_c7_3275_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2117_c7_3275_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2117_c7_3275_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2117_c7_3275_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2117_c7_3275_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2117_c7_3275_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2117_c7_3275_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2117_c7_3275_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2117_c7_3275_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2117_c7_3275_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2117_c7_3275_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2117_c7_3275_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2117_c7_3275_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2117_c7_3275_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2117_c7_3275_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2117_c7_3275_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2117_c7_3275_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2117_c7_3275_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_ca38_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_ca38_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_ca38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2122_c7_4d21_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2122_c7_4d21_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2125_c7_18a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2122_c7_4d21_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2122_c7_4d21_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2123_c3_33a0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2122_c7_4d21_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2122_c7_4d21_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2122_c7_4d21_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2122_c7_4d21_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2122_c7_4d21_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2125_c7_18a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2122_c7_4d21_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2122_c7_4d21_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2122_c7_4d21_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2125_c7_18a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2122_c7_4d21_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2122_c7_4d21_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2122_c7_4d21_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2125_c7_18a0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2122_c7_4d21_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2122_c7_4d21_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2122_c7_4d21_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2125_c7_18a0_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2122_c7_4d21_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2122_c7_4d21_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2122_c7_4d21_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2125_c7_18a0_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2122_c7_4d21_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2122_c7_4d21_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2122_c7_4d21_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2125_c7_18a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2122_c7_4d21_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2122_c7_4d21_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2122_c7_4d21_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2125_c7_18a0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2122_c7_4d21_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2125_c11_77c3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2125_c11_77c3_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2125_c11_77c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2125_c7_18a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2125_c7_18a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2131_c7_12ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2125_c7_18a0_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2125_c7_18a0_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2125_c7_18a0_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2131_c7_12ab_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2125_c7_18a0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2125_c7_18a0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2125_c7_18a0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2125_c7_18a0_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2125_c7_18a0_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2125_c7_18a0_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2131_c7_12ab_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2125_c7_18a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2125_c7_18a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2125_c7_18a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2131_c7_12ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2125_c7_18a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2125_c7_18a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2125_c7_18a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2125_c7_18a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2125_c7_18a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2125_c7_18a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2131_c7_12ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2125_c7_18a0_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2125_c7_18a0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2125_c7_18a0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2125_c7_18a0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2126_c3_4bc0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2126_c3_4bc0_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2126_c3_4bc0_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2129_c32_c0ed_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2129_c32_c0ed_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2129_c32_c0ed_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2129_c32_0415_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2129_c32_0415_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2129_c32_0415_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2129_c32_4840_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2129_c32_4840_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2129_c32_4840_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2129_c32_c0ed_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2131_c11_81f6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2131_c11_81f6_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2131_c11_81f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2131_c7_12ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2131_c7_12ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2131_c7_12ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2131_c7_12ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2131_c7_12ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_c111_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2131_c7_12ab_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2131_c7_12ab_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2131_c7_12ab_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2137_c7_c111_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2131_c7_12ab_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2131_c7_12ab_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2131_c7_12ab_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2137_c7_c111_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2131_c7_12ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2131_c7_12ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2131_c7_12ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2137_c7_c111_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2131_c7_12ab_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2135_c32_c980_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2135_c32_c980_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2135_c22_026b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2137_c11_74fd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2137_c11_74fd_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2137_c11_74fd_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2137_c7_c111_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2137_c7_c111_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2137_c7_c111_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2137_c7_c111_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2137_c7_c111_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2142_c7_e667_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2137_c7_c111_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_c111_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_c111_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_e667_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_c111_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2137_c7_c111_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l2139_c3_039b : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2137_c7_c111_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2137_c7_c111_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2139_c21_c64b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2139_c21_c64b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2139_c21_c64b_return_output : unsigned(16 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2140_c22_39ae_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c11_94ae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c11_94ae_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c11_94ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_e667_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_e667_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_e667_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2142_c7_e667_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2142_c7_e667_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2142_c7_e667_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2110_l2107_l2131_l2102_l2099_DUPLICATE_679a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2142_l2110_l2107_l2102_l2125_l2099_DUPLICATE_2b8d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2110_l2107_l2102_l2125_l2099_DUPLICATE_f8e5_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2110_l2137_l2107_l2102_l2125_l2099_DUPLICATE_0a32_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2110_l2137_l2107_l2102_l2125_l2099_DUPLICATE_0976_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2122_l2117_l2114_l2110_l2107_l2102_l2125_l2099_DUPLICATE_2544_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2122_l2117_l2114_l2142_l2110_l2137_l2107_l2131_l2102_l2125_l2099_DUPLICATE_7715_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2111_l2118_l2103_l2126_DUPLICATE_50fa_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2104_l2119_DUPLICATE_9032_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2104_l2119_DUPLICATE_9032_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a413_uxn_opcodes_h_l2147_l2089_DUPLICATE_e34a_return_output : opcode_result_t;
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
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2139_c21_c64b_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c11_94ae_right := to_unsigned(11, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2105_c3_9aaf := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2102_c7_9565_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2105_c3_9aaf;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2115_c3_dfe0 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2114_c7_d772_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2115_c3_dfe0;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2093_c2_8136_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2117_c11_0ea0_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2102_c11_9526_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2096_c3_d1fd := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c2_8136_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2096_c3_d1fd;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2093_c6_7a03_right := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2131_c7_12ab_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_ca38_right := to_unsigned(7, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2137_c7_c111_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l2129_c32_c0ed_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_5e53_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2114_c11_3f41_right := to_unsigned(5, 3);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2129_c32_4840_right := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2142_c7_e667_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2108_c3_4308 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_2c0e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2108_c3_4308;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2131_c11_81f6_right := to_unsigned(9, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c1_a49e_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2137_c11_74fd_right := to_unsigned(10, 4);
     VAR_MUX_uxn_opcodes_h_l2129_c32_c0ed_iffalse := resize(to_signed(-4, 4), 8);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2125_c7_18a0_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2120_c3_115a := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2117_c7_3275_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2120_c3_115a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2099_c11_86e2_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2125_c7_18a0_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2112_c3_9d3b := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2110_c7_a2a8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2112_c3_9d3b;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2129_c32_0415_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2100_c3_cf12 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2099_c7_c851_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2100_c3_cf12;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2093_c2_8136_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2125_c11_77c3_right := to_unsigned(8, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_e667_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2110_c11_568b_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2123_c3_33a0 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2122_c7_4d21_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2123_c3_33a0;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2131_c7_12ab_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c1_a49e_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2129_c32_0415_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2126_c3_4bc0_left := n16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2135_c32_c980_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2093_c2_8136_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2099_c7_c851_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2102_c7_9565_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2107_c7_2c0e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2110_c7_a2a8_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2114_c7_d772_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2122_c7_4d21_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2125_c7_18a0_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2093_c6_7a03_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2099_c11_86e2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2102_c11_9526_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_5e53_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2110_c11_568b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2114_c11_3f41_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2117_c11_0ea0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_ca38_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2125_c11_77c3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2131_c11_81f6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2137_c11_74fd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c11_94ae_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2111_c3_5270_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2139_c21_c64b_left := t16;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2131_c7_12ab_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2093_c2_8136_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2099_c7_c851_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2107_c7_2c0e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2110_c7_a2a8_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2107_c11_5e53] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2107_c11_5e53_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_5e53_left;
     BIN_OP_EQ_uxn_opcodes_h_l2107_c11_5e53_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_5e53_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_5e53_return_output := BIN_OP_EQ_uxn_opcodes_h_l2107_c11_5e53_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2131_c11_81f6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2131_c11_81f6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2131_c11_81f6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2131_c11_81f6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2131_c11_81f6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2131_c11_81f6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2131_c11_81f6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2093_c6_7a03] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2093_c6_7a03_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2093_c6_7a03_left;
     BIN_OP_EQ_uxn_opcodes_h_l2093_c6_7a03_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2093_c6_7a03_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2093_c6_7a03_return_output := BIN_OP_EQ_uxn_opcodes_h_l2093_c6_7a03_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2110_l2107_l2102_l2125_l2099_DUPLICATE_f8e5 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2110_l2107_l2102_l2125_l2099_DUPLICATE_f8e5_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2099_c11_86e2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2099_c11_86e2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2099_c11_86e2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2099_c11_86e2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2099_c11_86e2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2099_c11_86e2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2099_c11_86e2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2117_c11_0ea0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2117_c11_0ea0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2117_c11_0ea0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2117_c11_0ea0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2117_c11_0ea0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2117_c11_0ea0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2117_c11_0ea0_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2110_l2137_l2107_l2102_l2125_l2099_DUPLICATE_0a32 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2110_l2137_l2107_l2102_l2125_l2099_DUPLICATE_0a32_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l2114_c11_3f41] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2114_c11_3f41_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2114_c11_3f41_left;
     BIN_OP_EQ_uxn_opcodes_h_l2114_c11_3f41_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2114_c11_3f41_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2114_c11_3f41_return_output := BIN_OP_EQ_uxn_opcodes_h_l2114_c11_3f41_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2135_c32_c980] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2135_c32_c980_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2135_c32_c980_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2135_c32_c980_return_output := CONST_SR_8_uxn_opcodes_h_l2135_c32_c980_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2142_c11_94ae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2142_c11_94ae_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c11_94ae_left;
     BIN_OP_EQ_uxn_opcodes_h_l2142_c11_94ae_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c11_94ae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c11_94ae_return_output := BIN_OP_EQ_uxn_opcodes_h_l2142_c11_94ae_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2110_l2107_l2131_l2102_l2099_DUPLICATE_679a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2110_l2107_l2131_l2102_l2099_DUPLICATE_679a_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2122_l2117_l2114_l2110_l2107_l2102_l2125_l2099_DUPLICATE_2544 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2122_l2117_l2114_l2110_l2107_l2102_l2125_l2099_DUPLICATE_2544_return_output := result.is_stack_read;

     -- BIN_OP_AND[uxn_opcodes_h_l2129_c32_0415] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2129_c32_0415_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2129_c32_0415_left;
     BIN_OP_AND_uxn_opcodes_h_l2129_c32_0415_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2129_c32_0415_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2129_c32_0415_return_output := BIN_OP_AND_uxn_opcodes_h_l2129_c32_0415_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2110_l2137_l2107_l2102_l2125_l2099_DUPLICATE_0976 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2110_l2137_l2107_l2102_l2125_l2099_DUPLICATE_0976_return_output := result.ram_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2102_c11_9526] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2102_c11_9526_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2102_c11_9526_left;
     BIN_OP_EQ_uxn_opcodes_h_l2102_c11_9526_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2102_c11_9526_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2102_c11_9526_return_output := BIN_OP_EQ_uxn_opcodes_h_l2102_c11_9526_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2111_l2118_l2103_l2126_DUPLICATE_50fa LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2111_l2118_l2103_l2126_DUPLICATE_50fa_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_PLUS[uxn_opcodes_h_l2139_c21_c64b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2139_c21_c64b_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2139_c21_c64b_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2139_c21_c64b_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2139_c21_c64b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2139_c21_c64b_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2139_c21_c64b_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2122_c7_4d21] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2122_c7_4d21_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2140_c22_39ae] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2140_c22_39ae_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2125_c11_77c3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2125_c11_77c3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2125_c11_77c3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2125_c11_77c3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2125_c11_77c3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2125_c11_77c3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2125_c11_77c3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2122_c11_ca38] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2122_c11_ca38_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_ca38_left;
     BIN_OP_EQ_uxn_opcodes_h_l2122_c11_ca38_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_ca38_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_ca38_return_output := BIN_OP_EQ_uxn_opcodes_h_l2122_c11_ca38_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2110_c11_568b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2110_c11_568b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2110_c11_568b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2110_c11_568b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2110_c11_568b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2110_c11_568b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2110_c11_568b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2142_l2110_l2107_l2102_l2125_l2099_DUPLICATE_2b8d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2142_l2110_l2107_l2102_l2125_l2099_DUPLICATE_2b8d_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2122_l2117_l2114_l2142_l2110_l2137_l2107_l2131_l2102_l2125_l2099_DUPLICATE_7715 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2122_l2117_l2114_l2142_l2110_l2137_l2107_l2131_l2102_l2125_l2099_DUPLICATE_7715_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2137_c11_74fd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2137_c11_74fd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2137_c11_74fd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2137_c11_74fd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2137_c11_74fd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2137_c11_74fd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2137_c11_74fd_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2129_c32_4840_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2129_c32_0415_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c1_a49e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2093_c6_7a03_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2093_c2_8136_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2093_c6_7a03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2093_c2_8136_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2093_c6_7a03_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2093_c2_8136_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2093_c6_7a03_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c2_8136_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2093_c6_7a03_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2093_c2_8136_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2093_c6_7a03_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2093_c2_8136_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2093_c6_7a03_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2093_c2_8136_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2093_c6_7a03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c2_8136_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2093_c6_7a03_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c2_8136_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2093_c6_7a03_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2093_c2_8136_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2093_c6_7a03_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2099_c7_c851_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2099_c11_86e2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2099_c7_c851_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2099_c11_86e2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2099_c7_c851_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2099_c11_86e2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2099_c7_c851_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2099_c11_86e2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2099_c7_c851_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2099_c11_86e2_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2099_c7_c851_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2099_c11_86e2_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2099_c7_c851_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2099_c11_86e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2099_c7_c851_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2099_c11_86e2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2099_c7_c851_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2099_c11_86e2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2099_c7_c851_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2099_c11_86e2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2102_c7_9565_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2102_c11_9526_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2102_c7_9565_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2102_c11_9526_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2102_c7_9565_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2102_c11_9526_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2102_c7_9565_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2102_c11_9526_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2102_c7_9565_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2102_c11_9526_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2102_c7_9565_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2102_c11_9526_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2102_c7_9565_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2102_c11_9526_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2102_c7_9565_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2102_c11_9526_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2102_c7_9565_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2102_c11_9526_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2102_c7_9565_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2102_c11_9526_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2107_c7_2c0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_5e53_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_2c0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_5e53_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2107_c7_2c0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_5e53_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2107_c7_2c0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_5e53_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2107_c7_2c0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_5e53_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2107_c7_2c0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_5e53_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2107_c7_2c0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_5e53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_2c0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_5e53_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_2c0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_5e53_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2107_c7_2c0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c11_5e53_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2110_c7_a2a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2110_c11_568b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2110_c7_a2a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2110_c11_568b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2110_c7_a2a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2110_c11_568b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2110_c7_a2a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2110_c11_568b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2110_c7_a2a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2110_c11_568b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2110_c7_a2a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2110_c11_568b_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2110_c7_a2a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2110_c11_568b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2110_c7_a2a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2110_c11_568b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2110_c7_a2a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2110_c11_568b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2110_c7_a2a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2110_c11_568b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2114_c7_d772_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2114_c11_3f41_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2114_c7_d772_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2114_c11_3f41_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2114_c7_d772_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2114_c11_3f41_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2114_c7_d772_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2114_c11_3f41_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2114_c7_d772_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2114_c11_3f41_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2114_c7_d772_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2114_c11_3f41_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2114_c7_d772_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2114_c11_3f41_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2114_c7_d772_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2114_c11_3f41_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2114_c7_d772_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2114_c11_3f41_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2117_c7_3275_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2117_c11_0ea0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2117_c7_3275_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2117_c11_0ea0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2117_c7_3275_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2117_c11_0ea0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2117_c7_3275_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2117_c11_0ea0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2117_c7_3275_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2117_c11_0ea0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2117_c7_3275_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2117_c11_0ea0_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2117_c7_3275_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2117_c11_0ea0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2117_c7_3275_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2117_c11_0ea0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2117_c7_3275_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2117_c11_0ea0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2122_c7_4d21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_ca38_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2122_c7_4d21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_ca38_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2122_c7_4d21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_ca38_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2122_c7_4d21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_ca38_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2122_c7_4d21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_ca38_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2122_c7_4d21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_ca38_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2122_c7_4d21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_ca38_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2122_c7_4d21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_ca38_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2122_c7_4d21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2122_c11_ca38_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2125_c7_18a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2125_c11_77c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2125_c7_18a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2125_c11_77c3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2125_c7_18a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2125_c11_77c3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2125_c7_18a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2125_c11_77c3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2125_c7_18a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2125_c11_77c3_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2125_c7_18a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2125_c11_77c3_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2125_c7_18a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2125_c11_77c3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2125_c7_18a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2125_c11_77c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2131_c7_12ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2131_c11_81f6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2131_c7_12ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2131_c11_81f6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2131_c7_12ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2131_c11_81f6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2131_c7_12ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2131_c11_81f6_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2131_c7_12ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2131_c11_81f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_c111_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2137_c11_74fd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2137_c7_c111_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2137_c11_74fd_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2137_c7_c111_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2137_c11_74fd_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2137_c7_c111_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2137_c11_74fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_e667_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c11_94ae_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2142_c7_e667_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c11_94ae_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l2139_c3_039b := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2139_c21_c64b_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l2111_c3_5270_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2111_l2118_l2103_l2126_DUPLICATE_50fa_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2126_c3_4bc0_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2111_l2118_l2103_l2126_DUPLICATE_50fa_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2104_l2119_DUPLICATE_9032_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2111_l2118_l2103_l2126_DUPLICATE_50fa_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2137_c7_c111_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2140_c22_39ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c2_8136_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2110_l2107_l2102_l2125_l2099_DUPLICATE_f8e5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2099_c7_c851_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2110_l2107_l2102_l2125_l2099_DUPLICATE_f8e5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2102_c7_9565_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2110_l2107_l2102_l2125_l2099_DUPLICATE_f8e5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_2c0e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2110_l2107_l2102_l2125_l2099_DUPLICATE_f8e5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2110_c7_a2a8_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2110_l2107_l2102_l2125_l2099_DUPLICATE_f8e5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2114_c7_d772_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2110_l2107_l2102_l2125_l2099_DUPLICATE_f8e5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2117_c7_3275_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2110_l2107_l2102_l2125_l2099_DUPLICATE_f8e5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2122_c7_4d21_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2110_l2107_l2102_l2125_l2099_DUPLICATE_f8e5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2125_c7_18a0_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2110_l2107_l2102_l2125_l2099_DUPLICATE_f8e5_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2093_c2_8136_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2110_l2137_l2107_l2102_l2125_l2099_DUPLICATE_0a32_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2099_c7_c851_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2110_l2137_l2107_l2102_l2125_l2099_DUPLICATE_0a32_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2102_c7_9565_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2110_l2137_l2107_l2102_l2125_l2099_DUPLICATE_0a32_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2107_c7_2c0e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2110_l2137_l2107_l2102_l2125_l2099_DUPLICATE_0a32_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2110_c7_a2a8_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2110_l2137_l2107_l2102_l2125_l2099_DUPLICATE_0a32_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2114_c7_d772_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2110_l2137_l2107_l2102_l2125_l2099_DUPLICATE_0a32_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2117_c7_3275_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2110_l2137_l2107_l2102_l2125_l2099_DUPLICATE_0a32_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2122_c7_4d21_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2110_l2137_l2107_l2102_l2125_l2099_DUPLICATE_0a32_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2125_c7_18a0_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2110_l2137_l2107_l2102_l2125_l2099_DUPLICATE_0a32_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2137_c7_c111_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2110_l2137_l2107_l2102_l2125_l2099_DUPLICATE_0a32_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2099_c7_c851_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2122_l2117_l2114_l2142_l2110_l2137_l2107_l2131_l2102_l2125_l2099_DUPLICATE_7715_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2102_c7_9565_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2122_l2117_l2114_l2142_l2110_l2137_l2107_l2131_l2102_l2125_l2099_DUPLICATE_7715_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_2c0e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2122_l2117_l2114_l2142_l2110_l2137_l2107_l2131_l2102_l2125_l2099_DUPLICATE_7715_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2110_c7_a2a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2122_l2117_l2114_l2142_l2110_l2137_l2107_l2131_l2102_l2125_l2099_DUPLICATE_7715_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2114_c7_d772_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2122_l2117_l2114_l2142_l2110_l2137_l2107_l2131_l2102_l2125_l2099_DUPLICATE_7715_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2117_c7_3275_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2122_l2117_l2114_l2142_l2110_l2137_l2107_l2131_l2102_l2125_l2099_DUPLICATE_7715_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2122_c7_4d21_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2122_l2117_l2114_l2142_l2110_l2137_l2107_l2131_l2102_l2125_l2099_DUPLICATE_7715_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2125_c7_18a0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2122_l2117_l2114_l2142_l2110_l2137_l2107_l2131_l2102_l2125_l2099_DUPLICATE_7715_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2131_c7_12ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2122_l2117_l2114_l2142_l2110_l2137_l2107_l2131_l2102_l2125_l2099_DUPLICATE_7715_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_c111_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2122_l2117_l2114_l2142_l2110_l2137_l2107_l2131_l2102_l2125_l2099_DUPLICATE_7715_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_e667_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2122_l2117_l2114_l2142_l2110_l2137_l2107_l2131_l2102_l2125_l2099_DUPLICATE_7715_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2093_c2_8136_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2142_l2110_l2107_l2102_l2125_l2099_DUPLICATE_2b8d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2099_c7_c851_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2142_l2110_l2107_l2102_l2125_l2099_DUPLICATE_2b8d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2102_c7_9565_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2142_l2110_l2107_l2102_l2125_l2099_DUPLICATE_2b8d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2107_c7_2c0e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2142_l2110_l2107_l2102_l2125_l2099_DUPLICATE_2b8d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2110_c7_a2a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2142_l2110_l2107_l2102_l2125_l2099_DUPLICATE_2b8d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2114_c7_d772_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2142_l2110_l2107_l2102_l2125_l2099_DUPLICATE_2b8d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2117_c7_3275_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2142_l2110_l2107_l2102_l2125_l2099_DUPLICATE_2b8d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2122_c7_4d21_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2142_l2110_l2107_l2102_l2125_l2099_DUPLICATE_2b8d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2125_c7_18a0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2142_l2110_l2107_l2102_l2125_l2099_DUPLICATE_2b8d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2142_c7_e667_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2142_l2110_l2107_l2102_l2125_l2099_DUPLICATE_2b8d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c2_8136_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2110_l2107_l2131_l2102_l2099_DUPLICATE_679a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2099_c7_c851_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2110_l2107_l2131_l2102_l2099_DUPLICATE_679a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2102_c7_9565_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2110_l2107_l2131_l2102_l2099_DUPLICATE_679a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2107_c7_2c0e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2110_l2107_l2131_l2102_l2099_DUPLICATE_679a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2110_c7_a2a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2110_l2107_l2131_l2102_l2099_DUPLICATE_679a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2114_c7_d772_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2110_l2107_l2131_l2102_l2099_DUPLICATE_679a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2117_c7_3275_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2110_l2107_l2131_l2102_l2099_DUPLICATE_679a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2122_c7_4d21_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2110_l2107_l2131_l2102_l2099_DUPLICATE_679a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2131_c7_12ab_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2110_l2107_l2131_l2102_l2099_DUPLICATE_679a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2099_c7_c851_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2122_l2117_l2114_l2110_l2107_l2102_l2125_l2099_DUPLICATE_2544_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2102_c7_9565_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2122_l2117_l2114_l2110_l2107_l2102_l2125_l2099_DUPLICATE_2544_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2107_c7_2c0e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2122_l2117_l2114_l2110_l2107_l2102_l2125_l2099_DUPLICATE_2544_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2110_c7_a2a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2122_l2117_l2114_l2110_l2107_l2102_l2125_l2099_DUPLICATE_2544_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2114_c7_d772_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2122_l2117_l2114_l2110_l2107_l2102_l2125_l2099_DUPLICATE_2544_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2117_c7_3275_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2122_l2117_l2114_l2110_l2107_l2102_l2125_l2099_DUPLICATE_2544_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2122_c7_4d21_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2122_l2117_l2114_l2110_l2107_l2102_l2125_l2099_DUPLICATE_2544_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2125_c7_18a0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2122_l2117_l2114_l2110_l2107_l2102_l2125_l2099_DUPLICATE_2544_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2093_c2_8136_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2110_l2137_l2107_l2102_l2125_l2099_DUPLICATE_0976_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2099_c7_c851_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2110_l2137_l2107_l2102_l2125_l2099_DUPLICATE_0976_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2102_c7_9565_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2110_l2137_l2107_l2102_l2125_l2099_DUPLICATE_0976_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2107_c7_2c0e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2110_l2137_l2107_l2102_l2125_l2099_DUPLICATE_0976_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2110_c7_a2a8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2110_l2137_l2107_l2102_l2125_l2099_DUPLICATE_0976_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2114_c7_d772_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2110_l2137_l2107_l2102_l2125_l2099_DUPLICATE_0976_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2117_c7_3275_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2110_l2137_l2107_l2102_l2125_l2099_DUPLICATE_0976_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2122_c7_4d21_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2110_l2137_l2107_l2102_l2125_l2099_DUPLICATE_0976_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2125_c7_18a0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2110_l2137_l2107_l2102_l2125_l2099_DUPLICATE_0976_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2137_c7_c111_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2122_l2093_l2117_l2114_l2110_l2137_l2107_l2102_l2125_l2099_DUPLICATE_0976_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2122_c7_4d21_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2122_c7_4d21_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2137_c7_c111_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l2139_c3_039b;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2131_c7_12ab] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2131_c7_12ab_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2131_c7_12ab_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2131_c7_12ab_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2131_c7_12ab_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2131_c7_12ab_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2131_c7_12ab_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2131_c7_12ab_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2131_c7_12ab_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2126_c3_4bc0] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2126_c3_4bc0_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2126_c3_4bc0_left;
     BIN_OP_OR_uxn_opcodes_h_l2126_c3_4bc0_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2126_c3_4bc0_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2126_c3_4bc0_return_output := BIN_OP_OR_uxn_opcodes_h_l2126_c3_4bc0_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2111_c3_5270] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2111_c3_5270_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2111_c3_5270_left;
     BIN_OP_OR_uxn_opcodes_h_l2111_c3_5270_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2111_c3_5270_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2111_c3_5270_return_output := BIN_OP_OR_uxn_opcodes_h_l2111_c3_5270_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2122_c7_4d21] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2122_c7_4d21_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2122_c7_4d21_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2122_c7_4d21_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2122_c7_4d21_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2122_c7_4d21_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2122_c7_4d21_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2135_c22_026b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2135_c22_026b_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2135_c32_c980_return_output);

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2125_c7_18a0] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2125_c7_18a0_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2125_c7_18a0_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2125_c7_18a0_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2125_c7_18a0_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2125_c7_18a0_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2125_c7_18a0_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2125_c7_18a0_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2125_c7_18a0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2093_c1_a49e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c1_a49e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c1_a49e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c1_a49e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c1_a49e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c1_a49e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c1_a49e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c1_a49e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c1_a49e_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2142_c7_e667] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2142_c7_e667_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2142_c7_e667_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2142_c7_e667_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2142_c7_e667_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2142_c7_e667_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2142_c7_e667_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2142_c7_e667_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2142_c7_e667_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2104_l2119_DUPLICATE_9032 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2104_l2119_DUPLICATE_9032_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2104_l2119_DUPLICATE_9032_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2104_l2119_DUPLICATE_9032_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2104_l2119_DUPLICATE_9032_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2137_c7_c111] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2137_c7_c111_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2137_c7_c111_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2137_c7_c111_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2137_c7_c111_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2137_c7_c111_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2137_c7_c111_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2137_c7_c111_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2137_c7_c111_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2129_c32_4840] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2129_c32_4840_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2129_c32_4840_left;
     BIN_OP_GT_uxn_opcodes_h_l2129_c32_4840_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2129_c32_4840_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2129_c32_4840_return_output := BIN_OP_GT_uxn_opcodes_h_l2129_c32_4840_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2142_c7_e667] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_e667_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_e667_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_e667_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_e667_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_e667_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_e667_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_e667_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_e667_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2137_c7_c111] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2137_c7_c111_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2137_c7_c111_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2137_c7_c111_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2137_c7_c111_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2137_c7_c111_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2137_c7_c111_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2137_c7_c111_return_output := result_ram_value_MUX_uxn_opcodes_h_l2137_c7_c111_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2129_c32_c0ed_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2129_c32_4840_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2110_c7_a2a8_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2111_c3_5270_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2125_c7_18a0_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2126_c3_4bc0_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2131_c7_12ab_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2135_c22_026b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2117_c7_3275_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2104_l2119_DUPLICATE_9032_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2102_c7_9565_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2104_l2119_DUPLICATE_9032_return_output;
     VAR_printf_uxn_opcodes_h_l2094_c3_cbad_uxn_opcodes_h_l2094_c3_cbad_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2093_c1_a49e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_c111_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_e667_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2137_c7_c111_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2142_c7_e667_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2125_c7_18a0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2131_c7_12ab_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2122_c7_4d21_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2125_c7_18a0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2131_c7_12ab_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2137_c7_c111_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2131_c7_12ab_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2137_c7_c111_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2117_c7_3275_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output;
     -- t16_MUX[uxn_opcodes_h_l2110_c7_a2a8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2110_c7_a2a8_cond <= VAR_t16_MUX_uxn_opcodes_h_l2110_c7_a2a8_cond;
     t16_MUX_uxn_opcodes_h_l2110_c7_a2a8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2110_c7_a2a8_iftrue;
     t16_MUX_uxn_opcodes_h_l2110_c7_a2a8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2110_c7_a2a8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output := t16_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output;

     -- printf_uxn_opcodes_h_l2094_c3_cbad[uxn_opcodes_h_l2094_c3_cbad] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2094_c3_cbad_uxn_opcodes_h_l2094_c3_cbad_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2094_c3_cbad_uxn_opcodes_h_l2094_c3_cbad_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2137_c7_c111] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_c111_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_c111_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_c111_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_c111_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_c111_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_c111_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_c111_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_c111_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2137_c7_c111] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2137_c7_c111_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2137_c7_c111_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2137_c7_c111_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2137_c7_c111_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2137_c7_c111_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2137_c7_c111_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2137_c7_c111_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2137_c7_c111_return_output;

     -- n16_MUX[uxn_opcodes_h_l2125_c7_18a0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2125_c7_18a0_cond <= VAR_n16_MUX_uxn_opcodes_h_l2125_c7_18a0_cond;
     n16_MUX_uxn_opcodes_h_l2125_c7_18a0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2125_c7_18a0_iftrue;
     n16_MUX_uxn_opcodes_h_l2125_c7_18a0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2125_c7_18a0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2125_c7_18a0_return_output := n16_MUX_uxn_opcodes_h_l2125_c7_18a0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2125_c7_18a0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2125_c7_18a0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2125_c7_18a0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2125_c7_18a0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2125_c7_18a0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2125_c7_18a0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2125_c7_18a0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2125_c7_18a0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2125_c7_18a0_return_output;

     -- MUX[uxn_opcodes_h_l2129_c32_c0ed] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2129_c32_c0ed_cond <= VAR_MUX_uxn_opcodes_h_l2129_c32_c0ed_cond;
     MUX_uxn_opcodes_h_l2129_c32_c0ed_iftrue <= VAR_MUX_uxn_opcodes_h_l2129_c32_c0ed_iftrue;
     MUX_uxn_opcodes_h_l2129_c32_c0ed_iffalse <= VAR_MUX_uxn_opcodes_h_l2129_c32_c0ed_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2129_c32_c0ed_return_output := MUX_uxn_opcodes_h_l2129_c32_c0ed_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2131_c7_12ab] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2131_c7_12ab_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2131_c7_12ab_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2131_c7_12ab_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2131_c7_12ab_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2131_c7_12ab_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2131_c7_12ab_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2131_c7_12ab_return_output := result_ram_value_MUX_uxn_opcodes_h_l2131_c7_12ab_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2117_c7_3275] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2117_c7_3275_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2117_c7_3275_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2117_c7_3275_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2117_c7_3275_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2117_c7_3275_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2117_c7_3275_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2117_c7_3275_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2117_c7_3275_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2122_c7_4d21] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2122_c7_4d21_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2122_c7_4d21_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2122_c7_4d21_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2122_c7_4d21_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2122_c7_4d21_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2122_c7_4d21_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2131_c7_12ab] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2131_c7_12ab_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2131_c7_12ab_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2131_c7_12ab_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2131_c7_12ab_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2131_c7_12ab_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2131_c7_12ab_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2131_c7_12ab_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2131_c7_12ab_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2125_c7_18a0_iftrue := VAR_MUX_uxn_opcodes_h_l2129_c32_c0ed_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2122_c7_4d21_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2125_c7_18a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2131_c7_12ab_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2137_c7_c111_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2131_c7_12ab_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2137_c7_c111_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2122_c7_4d21_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2125_c7_18a0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2117_c7_3275_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2125_c7_18a0_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2131_c7_12ab_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2125_c7_18a0_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2131_c7_12ab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2114_c7_d772_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2117_c7_3275_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2107_c7_2c0e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l2125_c7_18a0] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2125_c7_18a0_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2125_c7_18a0_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2125_c7_18a0_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2125_c7_18a0_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2125_c7_18a0_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2125_c7_18a0_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2125_c7_18a0_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2125_c7_18a0_return_output;

     -- t16_MUX[uxn_opcodes_h_l2107_c7_2c0e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2107_c7_2c0e_cond <= VAR_t16_MUX_uxn_opcodes_h_l2107_c7_2c0e_cond;
     t16_MUX_uxn_opcodes_h_l2107_c7_2c0e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2107_c7_2c0e_iftrue;
     t16_MUX_uxn_opcodes_h_l2107_c7_2c0e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2107_c7_2c0e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output := t16_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2131_c7_12ab] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2131_c7_12ab_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2131_c7_12ab_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2131_c7_12ab_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2131_c7_12ab_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2131_c7_12ab_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2131_c7_12ab_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2131_c7_12ab_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2131_c7_12ab_return_output;

     -- n16_MUX[uxn_opcodes_h_l2122_c7_4d21] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2122_c7_4d21_cond <= VAR_n16_MUX_uxn_opcodes_h_l2122_c7_4d21_cond;
     n16_MUX_uxn_opcodes_h_l2122_c7_4d21_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2122_c7_4d21_iftrue;
     n16_MUX_uxn_opcodes_h_l2122_c7_4d21_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2122_c7_4d21_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output := n16_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2117_c7_3275] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2117_c7_3275_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2117_c7_3275_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2117_c7_3275_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2117_c7_3275_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2117_c7_3275_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2117_c7_3275_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2117_c7_3275_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2117_c7_3275_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2114_c7_d772] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2114_c7_d772_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2114_c7_d772_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2114_c7_d772_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2114_c7_d772_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2114_c7_d772_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2114_c7_d772_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2114_c7_d772_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2114_c7_d772_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2131_c7_12ab] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2131_c7_12ab_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2131_c7_12ab_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2131_c7_12ab_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2131_c7_12ab_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2131_c7_12ab_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2131_c7_12ab_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2131_c7_12ab_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2131_c7_12ab_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2122_c7_4d21] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2122_c7_4d21_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2122_c7_4d21_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2122_c7_4d21_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2122_c7_4d21_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2122_c7_4d21_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2122_c7_4d21_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2125_c7_18a0] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2125_c7_18a0_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2125_c7_18a0_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2125_c7_18a0_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2125_c7_18a0_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2125_c7_18a0_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2125_c7_18a0_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2125_c7_18a0_return_output := result_ram_value_MUX_uxn_opcodes_h_l2125_c7_18a0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2125_c7_18a0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2125_c7_18a0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2125_c7_18a0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2125_c7_18a0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2125_c7_18a0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2125_c7_18a0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2125_c7_18a0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2125_c7_18a0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2125_c7_18a0_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l2117_c7_3275_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2125_c7_18a0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2131_c7_12ab_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2125_c7_18a0_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2131_c7_12ab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2117_c7_3275_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2114_c7_d772_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2117_c7_3275_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2122_c7_4d21_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2125_c7_18a0_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2122_c7_4d21_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2125_c7_18a0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2122_c7_4d21_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2125_c7_18a0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2110_c7_a2a8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2114_c7_d772_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2102_c7_9565_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2110_c7_a2a8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2110_c7_a2a8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2110_c7_a2a8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2110_c7_a2a8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2110_c7_a2a8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2110_c7_a2a8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2110_c7_a2a8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2122_c7_4d21] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2122_c7_4d21_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2122_c7_4d21_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2122_c7_4d21_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2122_c7_4d21_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2122_c7_4d21_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2122_c7_4d21_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2114_c7_d772] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2114_c7_d772_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2114_c7_d772_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2114_c7_d772_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2114_c7_d772_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2114_c7_d772_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2114_c7_d772_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2114_c7_d772_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2114_c7_d772_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2117_c7_3275] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2117_c7_3275_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2117_c7_3275_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2117_c7_3275_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2117_c7_3275_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2117_c7_3275_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2117_c7_3275_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2117_c7_3275_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2117_c7_3275_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2122_c7_4d21] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2122_c7_4d21_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2122_c7_4d21_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2122_c7_4d21_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2122_c7_4d21_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2122_c7_4d21_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2122_c7_4d21_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2125_c7_18a0] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2125_c7_18a0_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2125_c7_18a0_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2125_c7_18a0_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2125_c7_18a0_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2125_c7_18a0_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2125_c7_18a0_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2125_c7_18a0_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2125_c7_18a0_return_output;

     -- t16_MUX[uxn_opcodes_h_l2102_c7_9565] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2102_c7_9565_cond <= VAR_t16_MUX_uxn_opcodes_h_l2102_c7_9565_cond;
     t16_MUX_uxn_opcodes_h_l2102_c7_9565_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2102_c7_9565_iftrue;
     t16_MUX_uxn_opcodes_h_l2102_c7_9565_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2102_c7_9565_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2102_c7_9565_return_output := t16_MUX_uxn_opcodes_h_l2102_c7_9565_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2122_c7_4d21] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2122_c7_4d21_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2122_c7_4d21_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2122_c7_4d21_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2122_c7_4d21_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2122_c7_4d21_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2122_c7_4d21_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output := result_ram_value_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output;

     -- n16_MUX[uxn_opcodes_h_l2117_c7_3275] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2117_c7_3275_cond <= VAR_n16_MUX_uxn_opcodes_h_l2117_c7_3275_cond;
     n16_MUX_uxn_opcodes_h_l2117_c7_3275_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2117_c7_3275_iftrue;
     n16_MUX_uxn_opcodes_h_l2117_c7_3275_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2117_c7_3275_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2117_c7_3275_return_output := n16_MUX_uxn_opcodes_h_l2117_c7_3275_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2125_c7_18a0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2125_c7_18a0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2125_c7_18a0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2125_c7_18a0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2125_c7_18a0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2125_c7_18a0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2125_c7_18a0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2125_c7_18a0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2125_c7_18a0_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2114_c7_d772_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2117_c7_3275_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2122_c7_4d21_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2125_c7_18a0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2122_c7_4d21_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2125_c7_18a0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2114_c7_d772_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2117_c7_3275_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2110_c7_a2a8_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2114_c7_d772_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2117_c7_3275_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2117_c7_3275_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2117_c7_3275_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_2c0e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2099_c7_c851_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2102_c7_9565_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2107_c7_2c0e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_2c0e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_2c0e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_2c0e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_2c0e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_2c0e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_2c0e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2110_c7_a2a8] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2110_c7_a2a8_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2110_c7_a2a8_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2110_c7_a2a8_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2110_c7_a2a8_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2110_c7_a2a8_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2110_c7_a2a8_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2122_c7_4d21] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2122_c7_4d21_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2122_c7_4d21_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2122_c7_4d21_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2122_c7_4d21_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2122_c7_4d21_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2122_c7_4d21_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2117_c7_3275] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2117_c7_3275_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2117_c7_3275_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2117_c7_3275_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2117_c7_3275_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2117_c7_3275_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2117_c7_3275_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2117_c7_3275_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2117_c7_3275_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2117_c7_3275] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2117_c7_3275_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2117_c7_3275_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2117_c7_3275_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2117_c7_3275_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2117_c7_3275_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2117_c7_3275_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2117_c7_3275_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2117_c7_3275_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2122_c7_4d21] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2122_c7_4d21_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2122_c7_4d21_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2122_c7_4d21_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2122_c7_4d21_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2122_c7_4d21_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2122_c7_4d21_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2117_c7_3275] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2117_c7_3275_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2117_c7_3275_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2117_c7_3275_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2117_c7_3275_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2117_c7_3275_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2117_c7_3275_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2117_c7_3275_return_output := result_ram_value_MUX_uxn_opcodes_h_l2117_c7_3275_return_output;

     -- t16_MUX[uxn_opcodes_h_l2099_c7_c851] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2099_c7_c851_cond <= VAR_t16_MUX_uxn_opcodes_h_l2099_c7_c851_cond;
     t16_MUX_uxn_opcodes_h_l2099_c7_c851_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2099_c7_c851_iftrue;
     t16_MUX_uxn_opcodes_h_l2099_c7_c851_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2099_c7_c851_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2099_c7_c851_return_output := t16_MUX_uxn_opcodes_h_l2099_c7_c851_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2114_c7_d772] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2114_c7_d772_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2114_c7_d772_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2114_c7_d772_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2114_c7_d772_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2114_c7_d772_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2114_c7_d772_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2114_c7_d772_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2114_c7_d772_return_output;

     -- n16_MUX[uxn_opcodes_h_l2114_c7_d772] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2114_c7_d772_cond <= VAR_n16_MUX_uxn_opcodes_h_l2114_c7_d772_cond;
     n16_MUX_uxn_opcodes_h_l2114_c7_d772_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2114_c7_d772_iftrue;
     n16_MUX_uxn_opcodes_h_l2114_c7_d772_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2114_c7_d772_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2114_c7_d772_return_output := n16_MUX_uxn_opcodes_h_l2114_c7_d772_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2110_c7_a2a8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2114_c7_d772_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2117_c7_3275_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2117_c7_3275_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2122_c7_4d21_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2110_c7_a2a8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2114_c7_d772_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2107_c7_2c0e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2114_c7_d772_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2117_c7_3275_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2114_c7_d772_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2117_c7_3275_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2114_c7_d772_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2117_c7_3275_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2102_c7_9565_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2093_c2_8136_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2099_c7_c851_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2114_c7_d772] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2114_c7_d772_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2114_c7_d772_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2114_c7_d772_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2114_c7_d772_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2114_c7_d772_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2114_c7_d772_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2114_c7_d772_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2114_c7_d772_return_output;

     -- n16_MUX[uxn_opcodes_h_l2110_c7_a2a8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2110_c7_a2a8_cond <= VAR_n16_MUX_uxn_opcodes_h_l2110_c7_a2a8_cond;
     n16_MUX_uxn_opcodes_h_l2110_c7_a2a8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2110_c7_a2a8_iftrue;
     n16_MUX_uxn_opcodes_h_l2110_c7_a2a8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2110_c7_a2a8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output := n16_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output;

     -- t16_MUX[uxn_opcodes_h_l2093_c2_8136] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2093_c2_8136_cond <= VAR_t16_MUX_uxn_opcodes_h_l2093_c2_8136_cond;
     t16_MUX_uxn_opcodes_h_l2093_c2_8136_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2093_c2_8136_iftrue;
     t16_MUX_uxn_opcodes_h_l2093_c2_8136_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2093_c2_8136_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2093_c2_8136_return_output := t16_MUX_uxn_opcodes_h_l2093_c2_8136_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2114_c7_d772] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2114_c7_d772_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2114_c7_d772_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2114_c7_d772_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2114_c7_d772_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2114_c7_d772_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2114_c7_d772_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2114_c7_d772_return_output := result_ram_value_MUX_uxn_opcodes_h_l2114_c7_d772_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2117_c7_3275] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2117_c7_3275_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2117_c7_3275_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2117_c7_3275_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2117_c7_3275_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2117_c7_3275_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2117_c7_3275_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2117_c7_3275_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2117_c7_3275_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2114_c7_d772] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2114_c7_d772_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2114_c7_d772_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2114_c7_d772_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2114_c7_d772_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2114_c7_d772_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2114_c7_d772_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2114_c7_d772_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2114_c7_d772_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2107_c7_2c0e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2107_c7_2c0e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2107_c7_2c0e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2107_c7_2c0e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2107_c7_2c0e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2107_c7_2c0e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2107_c7_2c0e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2117_c7_3275] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2117_c7_3275_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2117_c7_3275_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2117_c7_3275_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2117_c7_3275_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2117_c7_3275_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2117_c7_3275_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2117_c7_3275_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2117_c7_3275_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2110_c7_a2a8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2110_c7_a2a8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2110_c7_a2a8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2110_c7_a2a8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2110_c7_a2a8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2110_c7_a2a8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2110_c7_a2a8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2102_c7_9565] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2102_c7_9565_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2102_c7_9565_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2102_c7_9565_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2102_c7_9565_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2102_c7_9565_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2102_c7_9565_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2102_c7_9565_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2102_c7_9565_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2107_c7_2c0e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2114_c7_d772_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2117_c7_3275_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2114_c7_d772_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2117_c7_3275_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2107_c7_2c0e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2102_c7_9565_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2110_c7_a2a8_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2114_c7_d772_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2110_c7_a2a8_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2114_c7_d772_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2110_c7_a2a8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2114_c7_d772_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2099_c7_c851_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2102_c7_9565_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2093_c2_8136_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2110_c7_a2a8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2110_c7_a2a8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2110_c7_a2a8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2110_c7_a2a8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2110_c7_a2a8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2110_c7_a2a8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2110_c7_a2a8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2102_c7_9565] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2102_c7_9565_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2102_c7_9565_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2102_c7_9565_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2102_c7_9565_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2102_c7_9565_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2102_c7_9565_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2102_c7_9565_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2102_c7_9565_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2114_c7_d772] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2114_c7_d772_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2114_c7_d772_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2114_c7_d772_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2114_c7_d772_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2114_c7_d772_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2114_c7_d772_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2114_c7_d772_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2114_c7_d772_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2110_c7_a2a8] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2110_c7_a2a8_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2110_c7_a2a8_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2110_c7_a2a8_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2110_c7_a2a8_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2110_c7_a2a8_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2110_c7_a2a8_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2107_c7_2c0e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2107_c7_2c0e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2107_c7_2c0e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2107_c7_2c0e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2107_c7_2c0e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2107_c7_2c0e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2107_c7_2c0e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2110_c7_a2a8] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2110_c7_a2a8_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2110_c7_a2a8_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2110_c7_a2a8_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2110_c7_a2a8_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2110_c7_a2a8_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2110_c7_a2a8_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output := result_ram_value_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output;

     -- n16_MUX[uxn_opcodes_h_l2107_c7_2c0e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2107_c7_2c0e_cond <= VAR_n16_MUX_uxn_opcodes_h_l2107_c7_2c0e_cond;
     n16_MUX_uxn_opcodes_h_l2107_c7_2c0e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2107_c7_2c0e_iftrue;
     n16_MUX_uxn_opcodes_h_l2107_c7_2c0e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2107_c7_2c0e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output := n16_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2099_c7_c851] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2099_c7_c851_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2099_c7_c851_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2099_c7_c851_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2099_c7_c851_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2099_c7_c851_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2099_c7_c851_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2099_c7_c851_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2099_c7_c851_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2114_c7_d772] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2114_c7_d772_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2114_c7_d772_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2114_c7_d772_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2114_c7_d772_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2114_c7_d772_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2114_c7_d772_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2114_c7_d772_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2114_c7_d772_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2102_c7_9565_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2110_c7_a2a8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2114_c7_d772_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2110_c7_a2a8_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2114_c7_d772_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2102_c7_9565_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2099_c7_c851_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2102_c7_9565_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2107_c7_2c0e_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2107_c7_2c0e_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_2c0e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c2_8136_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2099_c7_c851_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2110_c7_a2a8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2110_c7_a2a8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2110_c7_a2a8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2110_c7_a2a8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2110_c7_a2a8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2110_c7_a2a8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2110_c7_a2a8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2099_c7_c851] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2099_c7_c851_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2099_c7_c851_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2099_c7_c851_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2099_c7_c851_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2099_c7_c851_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2099_c7_c851_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2099_c7_c851_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2099_c7_c851_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2107_c7_2c0e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_2c0e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_2c0e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_2c0e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_2c0e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_2c0e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_2c0e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2102_c7_9565] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2102_c7_9565_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2102_c7_9565_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2102_c7_9565_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2102_c7_9565_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2102_c7_9565_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2102_c7_9565_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2102_c7_9565_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2102_c7_9565_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2110_c7_a2a8] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2110_c7_a2a8_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2110_c7_a2a8_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2110_c7_a2a8_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2110_c7_a2a8_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2110_c7_a2a8_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2110_c7_a2a8_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output;

     -- n16_MUX[uxn_opcodes_h_l2102_c7_9565] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2102_c7_9565_cond <= VAR_n16_MUX_uxn_opcodes_h_l2102_c7_9565_cond;
     n16_MUX_uxn_opcodes_h_l2102_c7_9565_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2102_c7_9565_iftrue;
     n16_MUX_uxn_opcodes_h_l2102_c7_9565_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2102_c7_9565_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2102_c7_9565_return_output := n16_MUX_uxn_opcodes_h_l2102_c7_9565_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2093_c2_8136] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c2_8136_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c2_8136_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c2_8136_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c2_8136_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c2_8136_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c2_8136_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c2_8136_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c2_8136_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2107_c7_2c0e] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2107_c7_2c0e_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2107_c7_2c0e_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2107_c7_2c0e_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2107_c7_2c0e_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2107_c7_2c0e_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2107_c7_2c0e_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output := result_ram_value_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2107_c7_2c0e] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2107_c7_2c0e_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2107_c7_2c0e_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2107_c7_2c0e_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2107_c7_2c0e_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2107_c7_2c0e_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2107_c7_2c0e_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2099_c7_c851_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2102_c7_9565_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_2c0e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2107_c7_2c0e_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2110_c7_a2a8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2099_c7_c851_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2102_c7_9565_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2093_c2_8136_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2099_c7_c851_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2102_c7_9565_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2102_c7_9565_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2102_c7_9565_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2107_c7_2c0e] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2107_c7_2c0e_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2107_c7_2c0e_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2107_c7_2c0e_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2107_c7_2c0e_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2107_c7_2c0e_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2107_c7_2c0e_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2102_c7_9565] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2102_c7_9565_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2102_c7_9565_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2102_c7_9565_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2102_c7_9565_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2102_c7_9565_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2102_c7_9565_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2102_c7_9565_return_output := result_ram_value_MUX_uxn_opcodes_h_l2102_c7_9565_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2099_c7_c851] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2099_c7_c851_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2099_c7_c851_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2099_c7_c851_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2099_c7_c851_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2099_c7_c851_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2099_c7_c851_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2099_c7_c851_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2099_c7_c851_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2107_c7_2c0e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_2c0e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_2c0e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_2c0e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_2c0e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_2c0e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_2c0e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2102_c7_9565] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2102_c7_9565_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2102_c7_9565_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2102_c7_9565_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2102_c7_9565_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2102_c7_9565_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2102_c7_9565_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2102_c7_9565_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2102_c7_9565_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2093_c2_8136] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2093_c2_8136_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2093_c2_8136_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2093_c2_8136_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2093_c2_8136_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2093_c2_8136_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2093_c2_8136_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2093_c2_8136_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2093_c2_8136_return_output;

     -- n16_MUX[uxn_opcodes_h_l2099_c7_c851] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2099_c7_c851_cond <= VAR_n16_MUX_uxn_opcodes_h_l2099_c7_c851_cond;
     n16_MUX_uxn_opcodes_h_l2099_c7_c851_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2099_c7_c851_iftrue;
     n16_MUX_uxn_opcodes_h_l2099_c7_c851_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2099_c7_c851_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2099_c7_c851_return_output := n16_MUX_uxn_opcodes_h_l2099_c7_c851_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2102_c7_9565] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2102_c7_9565_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2102_c7_9565_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2102_c7_9565_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2102_c7_9565_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2102_c7_9565_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2102_c7_9565_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2102_c7_9565_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2102_c7_9565_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2093_c2_8136_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2099_c7_c851_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2102_c7_9565_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2102_c7_9565_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2107_c7_2c0e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c2_8136_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2099_c7_c851_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2099_c7_c851_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2102_c7_9565_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2099_c7_c851_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2102_c7_9565_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2099_c7_c851_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2102_c7_9565_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l2099_c7_c851] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2099_c7_c851_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2099_c7_c851_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2099_c7_c851_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2099_c7_c851_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2099_c7_c851_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2099_c7_c851_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2099_c7_c851_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2099_c7_c851_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2102_c7_9565] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2102_c7_9565_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2102_c7_9565_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2102_c7_9565_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2102_c7_9565_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2102_c7_9565_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2102_c7_9565_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2102_c7_9565_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2102_c7_9565_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2102_c7_9565] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2102_c7_9565_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2102_c7_9565_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2102_c7_9565_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2102_c7_9565_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2102_c7_9565_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2102_c7_9565_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2102_c7_9565_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2102_c7_9565_return_output;

     -- n16_MUX[uxn_opcodes_h_l2093_c2_8136] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2093_c2_8136_cond <= VAR_n16_MUX_uxn_opcodes_h_l2093_c2_8136_cond;
     n16_MUX_uxn_opcodes_h_l2093_c2_8136_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2093_c2_8136_iftrue;
     n16_MUX_uxn_opcodes_h_l2093_c2_8136_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2093_c2_8136_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2093_c2_8136_return_output := n16_MUX_uxn_opcodes_h_l2093_c2_8136_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2093_c2_8136] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c2_8136_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c2_8136_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c2_8136_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c2_8136_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c2_8136_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c2_8136_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c2_8136_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c2_8136_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2099_c7_c851] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2099_c7_c851_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2099_c7_c851_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2099_c7_c851_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2099_c7_c851_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2099_c7_c851_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2099_c7_c851_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2099_c7_c851_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2099_c7_c851_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2099_c7_c851] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2099_c7_c851_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2099_c7_c851_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2099_c7_c851_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2099_c7_c851_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2099_c7_c851_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2099_c7_c851_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2099_c7_c851_return_output := result_ram_value_MUX_uxn_opcodes_h_l2099_c7_c851_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2093_c2_8136_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2099_c7_c851_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2102_c7_9565_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2099_c7_c851_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2102_c7_9565_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2093_c2_8136_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2099_c7_c851_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2093_c2_8136_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2099_c7_c851_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c2_8136_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2099_c7_c851_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l2093_c2_8136] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2093_c2_8136_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2093_c2_8136_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2093_c2_8136_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2093_c2_8136_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2093_c2_8136_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2093_c2_8136_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2093_c2_8136_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2093_c2_8136_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2099_c7_c851] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2099_c7_c851_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2099_c7_c851_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2099_c7_c851_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2099_c7_c851_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2099_c7_c851_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2099_c7_c851_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2099_c7_c851_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2099_c7_c851_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2093_c2_8136] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c2_8136_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c2_8136_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c2_8136_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c2_8136_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c2_8136_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c2_8136_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c2_8136_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c2_8136_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2099_c7_c851] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2099_c7_c851_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2099_c7_c851_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2099_c7_c851_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2099_c7_c851_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2099_c7_c851_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2099_c7_c851_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2099_c7_c851_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2099_c7_c851_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2093_c2_8136] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2093_c2_8136_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2093_c2_8136_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2093_c2_8136_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2093_c2_8136_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2093_c2_8136_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2093_c2_8136_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2093_c2_8136_return_output := result_ram_value_MUX_uxn_opcodes_h_l2093_c2_8136_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2093_c2_8136_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2099_c7_c851_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2093_c2_8136_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2099_c7_c851_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2093_c2_8136] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2093_c2_8136_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2093_c2_8136_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2093_c2_8136_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2093_c2_8136_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2093_c2_8136_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2093_c2_8136_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2093_c2_8136_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2093_c2_8136_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2093_c2_8136] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2093_c2_8136_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2093_c2_8136_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2093_c2_8136_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2093_c2_8136_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2093_c2_8136_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2093_c2_8136_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2093_c2_8136_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2093_c2_8136_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a413_uxn_opcodes_h_l2147_l2089_DUPLICATE_e34a LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a413_uxn_opcodes_h_l2147_l2089_DUPLICATE_e34a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a413(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2093_c2_8136_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2093_c2_8136_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2093_c2_8136_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2093_c2_8136_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2093_c2_8136_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2093_c2_8136_return_output,
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2093_c2_8136_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2093_c2_8136_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a413_uxn_opcodes_h_l2147_l2089_DUPLICATE_e34a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a413_uxn_opcodes_h_l2147_l2089_DUPLICATE_e34a_return_output;
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
